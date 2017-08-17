package org.iii.eeit9503.ireading.controller.order;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.bean.PaymentBean;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.member.model.PaymentService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.order.bean.Cart;
import org.iii.eeit9503.ireading.order.bean.CartItem;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.iii.eeit9503.ireading.order.model.OrderStatusService;
import org.iii.eeit9503.ireading.order.model.PayService;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.iii.eeit9503.ireading.product.model.SellListService;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
import org.iii.eeit9503.ireading.transfer.IDGgenerator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@RequestMapping("cart")
@SessionAttributes({"Cart","Order","OrderDetails","exdate"})
public class ShopingCartController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService productService;
	@Autowired
	private PayService payService;
	@Autowired
	private IDGgenerator idGgenerator;
	@Autowired
	private OrderStatusService orderStatusService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private SellListService sellListService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PaymentService paymentService;
	
	 public static final String CART_ID = "cart";  
	    /** 
	     * 查看购物车 
	     * @param request 
	     * @param model 
	     * @return 
	     */  
	    @RequestMapping(value = "/show", method = RequestMethod.GET)  
	    public String shoppingcart(HttpServletRequest request,Model model,SessionStatus sessionStatus){  
	    	 sessionStatus.setComplete();

	            //读取COOKIE  
	            Cart cart = this.getCart(request);
	            model.addAttribute("Cart",cart);
	            model.addAttribute("prepage",request.getHeader("Referer"));
	        return "cart.step1";  
	    }  
	    
	    
	    //查筆數
	    @RequestMapping(value = "/count",method={RequestMethod.POST},produces={"application/json;charset=UTF-8"})
	    @ResponseBody
	    public String getCount(HttpServletRequest request){  	        
	            //读取COOKIE  
	            Cart cart = this.getCart(request);
	            JSONArray array=new JSONArray();
		         JSONObject obj=new JSONObject();
		         obj.put("count",String.valueOf(cart.getsumnumb()));
		         array.put(obj);
	        return array.toString();
	    } 
	    
	    
	  //2連結到填寫購買資訊
	    @RequestMapping(value = "/buyinfo", method = RequestMethod.GET)  
	    public String BuyInfo(HttpServletRequest request,Model model){	        
	            //读取COOKIE  
	            Cart cart = this.getCart(request);
	            model.addAttribute("Cart",cart);
	        return "cart.step2";  
	    }
	    
	    
	//3連結到購買確認
	    @RequestMapping(value = "/check", method = {RequestMethod.POST,RequestMethod.GET})  
	    public String check(HttpServletRequest request,Model model,@RequestParam Map<String, Object> map){	        
	            //读取COOKIE
	            Cart cart = this.getCart(request);
	            
	            String pay=MapUtils.getString(map, "pay");
	            String reciepient=MapUtils.getString(map, "reciepient");
	            String oaddr=MapUtils.getString(map, "oaddr");
	            String omemo=MapUtils.getString(map, "omemo");
	            
	            OrderBean obean=new OrderBean();
	            obean.setPayBean(payService.findByID(pay));
	            obean.setReciepient(reciepient);
	            obean.setOaddr(oaddr);
	            obean.setOmemo(omemo);
	            
	            model.addAttribute("Order",obean);
	            model.addAttribute("Cart",cart);	            
	        return "cart.step3";  
	    }
	    
	    //4連結到付款畫面
	    @RequestMapping(value="/bill",method={RequestMethod.GET})
	    public String creditCard(HttpServletRequest request,HttpServletResponse response,Model model,@ModelAttribute("Cart") Cart cart,@ModelAttribute("Order") OrderBean obean){
	    	if(obean.getPayBean().getPayID().equals("P0001"))
	    	{model.addAttribute("Cart",cart);
	    	model.addAttribute("Order",obean);
	    		return "cart.step4card";}
	    	
	    	if(obean.getPayBean().getPayID().equals("P0002")){
	    		
	    		String MemberID=null;
	    		try {
	    			MemberID =CookieUtils.findCookie(request, "login_id");
	    		} catch (UnsupportedEncodingException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    			return request.getHeader("referer").substring(30);
	    		}
	    		
	    		obean.setOrderID(idGgenerator.getOrderID());
	    		obean.setMemberID(MemberID);
	    		obean.setOrderStatusBean(orderStatusService.findByID("OS002"));
	    		obean.setOdate(DateTansfer.Now());
	    		obean.setOtotal(cart.getSumtotal());
	    		obean.setPaid(0);
	    		int update=orderService.insert(obean);
	    		if(update==1){
	    			for(CartItem item :cart.getItems()){
	    				OrderDetailBean odbean=new OrderDetailBean();
	    				ProductBean pbean=item.getProductBean();
	    				
	    				odbean.setOrderID(obean.getOrderID());
	    				odbean.setProductBean(pbean);	    			
	    				int insert=orderDetailService.insert(odbean);
	    				if(insert==1){pbean.setStatusID("S0007");
	    				productService.update(pbean);
	    				}
	    				else{System.out.println("新增訂單明細失敗");}
	    			}
	    			model.addAttribute("Order",obean);
	    			model.addAttribute("OrderDetails",orderDetailService.findByOrderID(obean.getOrderID()));
	    			model.addAttribute("Cart",cart);
	    			model.addAttribute("exdate",DateTansfer.getExDate());
	    			CookieUtils.deleteCookie(response,ShopingCartController.CART_ID);
	    			return "cart.step5";
	    		}
	    		else{System.out.println("新增訂單失敗");}
	    		
	    	}	    	
	    	return null;	    	
	    }
	    
	    //5新用卡驗證
	    @RequestMapping(value="card",method={RequestMethod.POST})
	    public String payByCard(HttpServletRequest request,HttpServletResponse response,Model model,@RequestParam Map<String, Object> map,@ModelAttribute("Cart") Cart cart,@ModelAttribute("Order") OrderBean obean){
	    	 String cardtype=MapUtils.getString(map, "cardtype");
	    	 String number=MapUtils.getString(map, "number");
	    	 
	    	 number=number.replaceAll(" ", "");
	    	 
	    	 System.out.println(number);
	    	 if(validate(number,cardtype)){
	    		 
	    		 String MemberID=null;
		    		try {
		    			MemberID =CookieUtils.findCookie(request, "login_id");
		    		} catch (UnsupportedEncodingException e) {
		    			// TODO Auto-generated catch block
		    			e.printStackTrace();
		    			return request.getHeader("referer").substring(30);
		    		}
	    		 
	    		 obean.setOrderID(idGgenerator.getOrderID());
		    		obean.setMemberID(MemberID);
		    		obean.setOrderStatusBean(orderStatusService.findByID("OS001"));
		    		obean.setOdate(DateTansfer.Now());
		    		obean.setOtotal(cart.getSumtotal());
		    		obean.setPaid(1);
		    		int update=orderService.insert(obean);
		    		if(update==1){
		    			for(CartItem item :cart.getItems()){
		    				OrderDetailBean odbean=new OrderDetailBean();
		    				ProductBean pbean=item.getProductBean();
		    				odbean.setOrderID(obean.getOrderID());
		    				odbean.setProductBean(pbean);	    			
		    				int insert=orderDetailService.insert(odbean);
		    				if(insert==1){pbean.setStatusID("S0007");
		    				productService.update(pbean);
		    				
		    				PaymentBean paymentBean=new PaymentBean();
		    				paymentBean.setProductBean(pbean);
		    				
		    				MemberBean mbean=memberService.select(sellListService.findByPrimaryKey(pbean.getSellListID()).getMemberID());
		    				paymentBean.setMemberID(mbean.getMemberID());
		    				double amount=pbean.getProductPrice()*0.7;
		    				paymentBean.setAmount(amount);
		    				
		    				paymentBean.setPaytime(DateTansfer.Now());
		    				
		    				mbean.setIncome(mbean.getIncome()+amount);
		    				
		    				int inset=paymentService.insert(paymentBean);
		    				if(insert==1){
		    					MemberBean income=memberService.update(mbean);
		    					if(income!=null){System.out.println(income.getMemberID()+"新增款項成功");}
		    					else{System.out.println("新增會員收入失敗");}
		    				}else{System.out.println("新增付款失敗");}		    				
		    				}
		    				else{System.out.println("新增訂單明細失敗");}
		    			}
		    			model.addAttribute("Order",obean);
		    			model.addAttribute("OrderDetails",orderDetailService.findByOrderID(obean.getOrderID()));
		    			model.addAttribute("Cart",cart);
		    			CookieUtils.deleteCookie(response,ShopingCartController.CART_ID);
		    			return "cart.step5"; 
	    	 }
	    	 else{System.out.println("新增訂單失敗");}
	    	 }
	    	 else{model.addAttribute("error","信用卡驗證失敗");
	    	 return "cart.step4card";
	    	 } 
	    	 return null;
	    }
	    
	      
	    /** 
	     * 加入购物车 
	     * @param request 
	     * @param response 
	     * @param test 
	     * @throws Exception  
	     */  
	    @RequestMapping(value = "/add/{ProductID}",method={RequestMethod.POST},produces={"application/json;charset=UTF-8"})
	    @ResponseBody
	    public String addItem(HttpServletRequest request,  
	            HttpServletResponse response,@PathVariable("ProductID") String ProductID) throws Exception {  
	        System.out.println(ProductID);
	        Cart cart = new Cart();  
	     
	            //读取COOKIE  
	        cart = this.getCart(request);  
	        ProductBean bean = productService.findByPrimaryKey(ProductID); 
	        CartItem item = new CartItem(bean);  
	        int update=cart.addItem(item); 
	        System.out.println(cart.getsumnumb());
	        int count=cart.getsumnumb();
	        //放入购物车  
	        saveToCookie(response, cart); 
	         JSONArray array=new JSONArray();
	         JSONObject obj=new JSONObject();
	         obj.put("change",String.valueOf(update));
	         obj.put("count",String.valueOf(count));
	         array.put(obj);
	        return array.toString();
	    }  
	      
	    /** 
	     * 删除某一项 
	     * @param request 
	     * @param response 
	     * @param test 
	     * @throws Exception  
	     */  
	    @RequestMapping(value = "/delete/{ProductID}",method={RequestMethod.POST},produces={"application/json;charset=UTF-8"})
	    @ResponseBody  
	    public String deleteItem(HttpServletRequest request,  
	            HttpServletResponse response,@PathVariable("ProductID") String ProductID) throws Exception {   
	        Cart cart = new Cart();  
	            cart = this.getCart(request);  
	          
	        ProductBean bean = productService.findByPrimaryKey(ProductID);  
	        CartItem item = new CartItem(bean);  
	        cart.deleteItem(item);  
	          
	        //放入购物车  
	        saveToCookie(response, cart);  
	          
	        return "1";
	    }  
	      
	    /** 
	     * 保存cookie 
	     */  
	    private void saveToCookie(HttpServletResponse response, Cart cart)  
	            throws Exception {  
	        CookieUtils.addCookie(response, CART_ID, cart.serialize());  
	    }  
	      
	    /** 
	     * 购物车的初始化 
	     *  
	     * @return CartService 
	     */  
	    private Cart getCart(HttpServletRequest request) {  
	        Cart cs = null;  
	        try {  
	            String cartStr = "";  
	            cartStr = CookieUtils.findCookie(request, CART_ID);
	            System.out.println(cartStr);
	            cs = new Cart();
	            if (cartStr != null && !"".equals(cartStr)) {  
	                cs.load(productService,cartStr);  
	            }  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }  
	        return cs;  
	    }  
	    
	    
	    
	    //信用卡驗證	    
	    public boolean validate(String sText,String cardtype) {
	        if(cardtype.equals("visa")){
	    	if (isValidVisa(sText)) {
	         return true;
	        } else {
	        	return false;
	        }}
	        if(cardtype.equals("master")){
	        	if (isValidMasterCard(sText)) {
	   	         return true;
	   	        } else {
	   	        	return false;
	   	        }	
	        }
	        return false;
	       }
	    //visa
	    public boolean isValidVisa(String sText) {
	    	System.out.println("visa match:"+sText.matches("\\b(4[0-9]{12}(?:[0-9]{3})?)\\b"));
	        if (sText.matches("\\b(4[0-9]{12}(?:[0-9]{3})?)\\b")) {
	         return true;
	        } else {
	         return false;
	        }
	       }  
	    //master
	    public boolean isValidMasterCard(String sText) {
	    	System.out.println("master match:"+sText.matches("^5[1-5][0-9]{14}$"));
	        if (sText.matches("^5[1-5][0-9]{14}$")) {
	         return true;
	        } else {
	         return false;
	        }
	       }
}
