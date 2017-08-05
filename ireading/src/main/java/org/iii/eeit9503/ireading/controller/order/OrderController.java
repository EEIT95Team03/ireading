package org.iii.eeit9503.ireading.controller.order;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.iii.eeit9503.ireading.member.model.OutputService;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.iii.eeit9503.ireading.order.bean.OrderStatusBean;
import org.iii.eeit9503.ireading.order.bean.PayBean;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.iii.eeit9503.ireading.order.model.OrderStatusService;
import org.iii.eeit9503.ireading.order.model.PayService;
import org.iii.eeit9503.ireading.order.model.PrimitiveNumberEditor;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
import org.iii.eeit9503.ireading.transfer.IDGgenerator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(path={"order.controller"})
@SessionAttributes(value = { "order", "OrderDetails" })
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderStatusService orderStatusService;
	@Autowired
	private PayService payService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private IDGgenerator idGgenerator;
	
	
	@RequestMapping(method={RequestMethod.GET})
	public String OrederList(Model model){
			System.out.println("--------------");
			List<OrderBean> list=orderService.getAll();
			model.addAttribute("orders", list);
			
			return "order.list";

		}

	
	public String update(String OrderID,String Odate,String Oinvoice,String memberid
			             ,String status,String Ototal,String pay,String Reciepient,String Oaddr
			             ,String Omemo,String orderaction,Model model){
		System.out.println("--------------");
		
		OrderBean bean=new OrderBean();
		if(OrderID!=null)bean.setOrderID(OrderID);
		if(Odate!=null)bean.setOdate(new DateTansfer().getTime(Odate.substring(0,Odate.length()-2)));
		if(Oinvoice!=null)bean.setInvoice(Oinvoice);
		if(memberid!=null)bean.setMemberID(memberid);
		if(status!=null)bean.setOrderStatusBean(orderStatusService.findByID(status));
		if(Ototal!=null)bean.setOtotal(Integer.parseInt(Ototal));
		if(pay!=null)bean.setPayBean(payService.findByID(pay));
		if(Reciepient!=null)bean.setReciepient(Reciepient);
		if(Oaddr!=null)bean.setOaddr(Oaddr);
		if(Omemo!=null){if(Omemo.length()>0)bean.setOmemo(Omemo);}
		
		
		if(orderaction.equals("update")){
		int update=orderService.update(bean);
		System.out.println(update+":"+OrderID);
		model.addAttribute("update",update);
		model.addAttribute("action",orderaction);
		model.addAttribute("id",OrderID);
		return OrederList(model);}
		
		
		if(orderaction.equals("delete")){
			int delete=orderService.delete(bean.getOrderID());
			System.out.println(delete+":"+OrderID);
			model.addAttribute("update",delete);
			model.addAttribute("action",orderaction);
			model.addAttribute("id",OrderID);
			if(delete==1){
			return "order.success";}
			else{return "order.faild";}}
			
		
		return null;
		}
	
	
	@RequestMapping(value="/delete",method={RequestMethod.POST},produces={"application/json"})
	@ResponseBody
	public String delete(String OrderID){
		int delete=orderService.delete(OrderID);
		JSONArray array=new JSONArray();
		JSONObject obj=new JSONObject();
		obj.put("action","delete");
		obj.put("id",OrderID);
		obj.put("change",delete);
		array.put(obj);
		return array.toString();		
	}
	
	@RequestMapping(value="/insert",method={RequestMethod.POST},produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String insert(String memberid,String status,String pay,String reciepient,String oaddr,String omemo){
		JSONObject error=new JSONObject();
		OrderBean bean = new OrderBean();
		//驗證資料
		bean.setOrderID(idGgenerator.getOrderID());
		bean.setOdate(new DateTansfer().Now());
		bean.setPaid(0);
		bean.setOtotal(0);
		if (memberid != ""){
			//未加上帳號確認
			bean.setMemberID(memberid);
			}
		else{error.put("memberid", "會員ID為必填欄位");}
		
		if (status != null){
			OrderStatusBean osbean=orderStatusService.findByID(status);
			if(osbean!=null)bean.setOrderStatusBean(osbean);}		
		
		if (pay != null){
			PayBean pbean=payService.findByID(pay);
			if(pbean !=null){
			bean.setPayBean(pbean);}
		}
		
		if (reciepient != null){
			bean.setReciepient(reciepient);}
		
		if (oaddr != null){bean.setOaddr(oaddr);}
		
		if (omemo != null) {if (omemo.length() > 0)bean.setOmemo(omemo);}
		
		if(error.length()>0){
		JSONArray errors=new JSONArray();
		error.put("change","0");
		error.put("action","insert");		
		errors.put(error);
		System.out.println(errors.toString());
		return errors.toString();
		}
		
		int insert=orderService.insert(bean);
		JSONArray array=new JSONArray();
		JSONObject obj=new JSONObject();
		obj.put("action","insert");
		obj.put("change",insert);		
		array.put(obj);
		System.out.println(array.toString());
		return array.toString();		
	}
	
	@RequestMapping(value="/{OrderID}",method={RequestMethod.GET})
	public String findbyid(@PathVariable("OrderID") String OrderID,Model model){
		try{
		OrderBean bean=orderService.findByID(OrderID);
		model.addAttribute("order",bean);
		List<OrderDetailBean> ODBean = orderDetailService.findByOrderID(OrderID);
		model.addAttribute("OrderDetails", ODBean);
		return "order.info";}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("查無OrderID");
			return OrederList(model);
		}
	}
	
	
	@RequestMapping(value="/update",method={RequestMethod.POST},produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String update(String OrderID, String Odate, String Oinvoice, String memberid, String status,
			String Ototal, String Opaid, String pay, String reciepient, String Oaddr, String Omemo)
	{
	JSONObject error=new JSONObject();
	
		OrderBean bean = new OrderBean();
		//資料驗證
		if (OrderID != ""){
			bean.setOrderID(OrderID);}
		else{error.put("OrderID", "訂單編號錯誤");}
		
		if (Odate != ""){
			try{
			bean.setOdate(new DateTansfer().getTime(Odate.substring(0, Odate.length() - 2)));}
			catch (Exception e) {
				// TODO: handle exception
				error.put("Odate", "訂單日期錯誤");
			}
			}else{error.put("Odate", "訂單日期錯誤");}
		
		if (Opaid.equals("0")||Opaid.equals("1")){
			bean.setPaid(Integer.parseInt(Opaid));
			}else{error.put("Opaid", "付款錯誤");}
		
		
		if (memberid != ""){
			//未加上帳號確認
			bean.setMemberID(memberid);
			}else{error.put("Opaid", "付款錯誤");}
		
		if (Oinvoice != ""){
			if(Oinvoice.matches("[A-Z]{2}[0-9]{8}")){bean.setInvoice(Oinvoice);}
			else{error.put("Oinvoice", "發票格式錯誤");}
			}	
		
		
		if (status != ""){
			OrderStatusBean osbean=orderStatusService.findByID(status);
			if(osbean!=null){bean.setOrderStatusBean(osbean);}
			else{error.put("status", "訂單狀態錯誤");}
			}
		else{error.put("status", "訂單狀態錯誤");}
		
		if (Ototal != ""){
			try{
			bean.setOtotal(Integer.parseInt(Ototal));
			}catch (Exception e) {
				error.put("Ototal", "訂單金額錯誤");
			}}
		else{bean.setOtotal(0);}
		
		
		if (pay != ""){
			PayBean pbean=payService.findByID(pay);
			if(pbean !=null){bean.setPayBean(pbean);}
			else{error.put("pay", "付款方式錯誤");}
		}
		else{error.put("pay", "付款方式錯誤");}
		
		if (reciepient != ""){
			bean.setReciepient(reciepient);}
		
		if (Oaddr != ""){bean.setOaddr(Oaddr);}
		
		if (Omemo != "") {bean.setOmemo(Omemo);}
		
		if(error.length()>0){
			error.put("error", "1");
			JSONArray array=new JSONArray();
			array.put(error);
			return array.toString();
		}
		
		
		//執行model
		int update=orderService.update(bean);
		System.out.println(update);
		JSONObject msg=new JSONObject();
		JSONArray msgArray=new JSONArray();
		msgArray.put(msg);
		if(update==1){
			msg.put("change","1");}
		else{
			msg.put("change","0");}
		
		return msgArray.toString();
	}
}
