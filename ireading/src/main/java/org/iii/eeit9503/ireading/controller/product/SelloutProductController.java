package org.iii.eeit9503.ireading.controller.product;

import java.util.List;

import org.iii.eeit9503.ireading.member.bean.PaymentBean;
import org.iii.eeit9503.ireading.member.model.PaymentService;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("sellout")
public class SelloutProductController {
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(method={RequestMethod.GET})
	public String list(String MemberID,Model model){
		
		List<PaymentBean> list=paymentService.findByMemberID("M170000013");
		model.addAttribute("PaymentList", list);				
		
		return "user.mySelloutList";
	}
	
	
}
