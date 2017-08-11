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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("sellout")
public class SelloutProductController {
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(method={RequestMethod.GET})
	public String list(String MemberID,Model model){
		
		List<PaymentBean> list=paymentService.findByMemberIDandMonth("M170000013","3");
		model.addAttribute("PaymentList", list);				
		
		return "user.mySelloutList";
	}
	
	@RequestMapping(value="query",method={RequestMethod.POST},produces={"application/json;charset=utf-8"})
	@ResponseBody
	public String query(String MemberID,String Action){
		List<PaymentBean> list=null;
		if(Action.equals("all")){
			list=paymentService.findByMemberID("M170000013");
		}else{list=paymentService.findByMemberIDandMonth("M170000013", Action);}       
		for(PaymentBean bean:list){
        	System.out.println(bean.getPaytime());       	
        }				
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		return gson.toJson(list);
	}
	
	
}
