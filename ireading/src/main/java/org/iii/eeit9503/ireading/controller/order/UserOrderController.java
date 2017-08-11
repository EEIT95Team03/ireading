package org.iii.eeit9503.ireading.controller.order;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("myorder")
public class UserOrderController {
	@Autowired
	private OrderService OrderService;
	@Autowired
	private OrderDetailService orderdetailService;
	
	@RequestMapping(value="getOrders",method={RequestMethod.GET})
	public String getOrders(HttpServletRequest request,Model model){
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		List<OrderBean> list=OrderService.getAllbyMemberID(MemberID);
		model.addAttribute("OrderCount",list.size());		
		model.addAttribute("Orders",list);		
		return "user.myOrder";				
	}
	
	@RequestMapping(value="getOD/{OrderID}",method={RequestMethod.GET})
	public String getOD(@PathVariable("OrderID") String OrderID,Model model){
		//此處先寫死
		OrderBean obean=OrderService.findByID(OrderID);
		model.addAttribute("Order",obean);	
		List<OrderDetailBean> odlist=orderdetailService.findByOrderID(OrderID);
		model.addAttribute("OrderDetails",odlist);			
		return "user.myOrderDetail";				
	}

}
