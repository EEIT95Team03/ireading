package org.iii.eeit9503.ireading.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.bean.OutputBean;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.member.model.OutputService;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.iii.eeit9503.ireading.order.model.OrderStatusService;
import org.iii.eeit9503.ireading.order.model.PayService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;


@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private MemberService memberService;
	private OutputService outputService;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		memberService = (MemberService) context.getBean("memberService");
		outputService = (OutputService) context.getBean("outputService");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//member
		//getAll
//		List<MemberBean> list=memberService.getAll();
//		for(MemberBean bean:list){
//			System.out.println(bean.getMemberID()+":"+bean.getMName());
//		}
		
//----------------------------------------------------------
		
		//Output
		//getAll
//		List<OutputBean> list=outputService.getAll();
//		for(OutputBean bean:list){
//			System.out.println(bean.getMemberID()+":"+bean.getAmount());
//		}
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
