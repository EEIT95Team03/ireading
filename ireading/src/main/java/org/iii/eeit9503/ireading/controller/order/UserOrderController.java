package org.iii.eeit9503.ireading.controller.order;

import java.util.List;

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
	public String getOrders(Model model){
		//此處先寫死
		List<OrderBean> list=OrderService.getAllbyMemberID("M170000016");
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
