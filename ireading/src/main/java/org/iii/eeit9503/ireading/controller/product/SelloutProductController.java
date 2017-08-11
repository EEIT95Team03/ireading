package org.iii.eeit9503.ireading.controller.product;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.iii.eeit9503.ireading.member.bean.PaymentBean;
import org.iii.eeit9503.ireading.member.model.PaymentService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
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
@RequestMapping("product/sellout")
public class SelloutProductController {
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(method={RequestMethod.GET})
	public String list(HttpServletRequest request,Model model){
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		
		
		List<PaymentBean> list=paymentService.findByMemberIDandMonth(MemberID,"3");
		model.addAttribute("PaymentList", list);				
		
		return "user.mySelloutList";
	}
	
	@RequestMapping(value="query",method={RequestMethod.POST},produces={"application/json;charset=utf-8"})
	@ResponseBody
	public String query(HttpServletRequest request,String Action){
		List<PaymentBean> list=null;
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		if(Action.equals("all")){
			list=paymentService.findByMemberID(MemberID);
		}else{list=paymentService.findByMemberIDandMonth(MemberID, Action);}       
		for(PaymentBean bean:list){
        	System.out.println(bean.getPaytime());       	
        }				
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		return gson.toJson(list);
	}
	
	
}
