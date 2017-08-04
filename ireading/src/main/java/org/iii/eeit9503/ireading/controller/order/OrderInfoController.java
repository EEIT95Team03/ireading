package org.iii.eeit9503.ireading.controller.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.engine.query.spi.ReturnMetadata;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.iii.eeit9503.ireading.order.bean.OrderStatusBean;
import org.iii.eeit9503.ireading.order.bean.PayBean;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.iii.eeit9503.ireading.order.model.OrderStatusService;
import org.iii.eeit9503.ireading.order.model.PayService;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
import org.iii.eeit9503.ireading.transfer.IDGgenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(path = { "/orderinfo.controller" })
@SessionAttributes(value = { "order", "OrderDetails" })
public class OrderInfoController {
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
    @Autowired
	private MemberService memberService;
    
	@RequestMapping(method = { RequestMethod.GET })
	public String getOrder(String OrderID, String orderaction, Model model) {
		System.out.println("--------------");
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		OrderBean bean = new OrderBean();
		if (OrderID != null)
			bean.setOrderID(OrderID);

		if (orderaction.equals("new")) {
			return "neworder.info";
		}

		if (orderaction.equals("getinfo")) {
			OrderBean Obean = orderService.findByID(bean.getOrderID());
			model.addAttribute("order", Obean);
			List<OrderDetailBean> ODBean = orderDetailService.findByOrderID(bean.getOrderID());
			model.addAttribute("OrderDetails", ODBean);
			return "order.info";
		}

		return null;
	}

	@RequestMapping(method = { RequestMethod.POST })
	public String editOrder(String OrderID, String Odate, String Oinvoice, String memberid, String status,
			String Ototal, String Opaid, String pay, String Reciepient, String Oaddr, String Omemo, String orderaction,
			Model model, String ProductID) {
		System.out.println("--------------");
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		OrderBean bean = new OrderBean();
		if (orderaction.equals("insert")) {
			System.out.println("insert");
			bean.setOrderID(idGgenerator.getOrderID());
			System.out.println(bean.getOrderID());
			bean.setOdate(new DateTansfer().Now());
			bean.setPaid(0);
		}else{
			if (OrderID != null)bean.setOrderID(OrderID);
			if (Odate != null)bean.setOdate(new DateTansfer().getTime(Odate.substring(0, Odate.length() - 2)));
			if (Opaid != null){
				bean.setPaid(Integer.parseInt(Opaid));}
		}

		if (memberid != null){
			//未加上帳號確認
			bean.setMemberID(memberid);
			}
		
		if (Oinvoice != null){
			if(Oinvoice.matches("[A-Z]{2}[0-9]{8}")){bean.setInvoice(Oinvoice);}
			}	
		
		
		if (status != null){
			OrderStatusBean osbean=orderStatusService.findByID(status);
			if(osbean!=null)bean.setOrderStatusBean(osbean);}
		
		if (Ototal != ""){
			bean.setOtotal(Integer.parseInt(Ototal));}
		else{bean.setOtotal(0);}
		
		
		if (pay != null){
			PayBean pbean=payService.findByID(pay);
			if(pbean !=null){
			bean.setPayBean(pbean);}
		}
		
		if (Reciepient != null){
			bean.setReciepient(Reciepient);}
		
		if (Oaddr != null){bean.setOaddr(Oaddr);}
		
		if (Omemo != null) {if (Omemo.length() > 0)bean.setOmemo(Omemo);}

		
		if(orderaction.equals("insert")){
			int update =orderService.insert(bean);
			System.out.println("insert=" + update + ":" + OrderID);
			if(update==1){
			return getOrder(bean.getOrderID(), "getinfo", model);}
		}
		
		if (orderaction.equals("update")) {
			int update = orderService.update(bean);
			System.out.println("update=" + update + ":" + OrderID);
//			model.addAttribute("update", update);
//			model.addAttribute("action", orderaction);
//			model.addAttribute("id", OrderID);
			return getOrder(bean.getOrderID(), "getinfo", model);
		}

		if (orderaction.equals("deleteOD")) {
			int update = orderDetailService.delete(bean.getOrderID(), ProductID);
			System.out.println("delete=" + update + ":" + bean.getOrderID() + ":" + ProductID);
			return getOrder(bean.getOrderID(), "getinfo", model);
		}

		if (orderaction.equals("delete")) {
			int delete = orderService.delete(bean.getOrderID());
			System.out.println(delete + ":" + OrderID);
			model.addAttribute("update", delete);
			model.addAttribute("action", orderaction);
			model.addAttribute("id", OrderID);
			return "";
		}

		return null;
	}

}
