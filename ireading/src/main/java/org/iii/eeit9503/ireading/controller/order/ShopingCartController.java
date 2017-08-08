package org.iii.eeit9503.ireading.controller.order;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.order.bean.Cart;
import org.iii.eeit9503.ireading.order.bean.CartItem;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.model.PayService;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@RequestMapping("cart")
@SessionAttributes({"Cart","Order"})
public class ShopingCartController {
	@Autowired
	private ProductService productService;
	@Autowired
	private PayService payService;
	
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
	    
	    
	  //連結到填寫購買資訊
	    @RequestMapping(value = "/buyinfo", method = RequestMethod.GET)  
	    public String BuyInfo(HttpServletRequest request,Model model){	        
	            //读取COOKIE  
	            Cart cart = this.getCart(request);
	            model.addAttribute("Cart",cart);
	            model.addAttribute("prepage",request.getHeader("Referer"));
	        return "cart.step2";  
	    }
	    
	    
	//連結到購買確認
	    @RequestMapping(value = "/check", method = RequestMethod.POST)  
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
	            model.addAttribute("prepage",request.getHeader("Referer"));
	            
	        return "cart.step3";  
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

}
