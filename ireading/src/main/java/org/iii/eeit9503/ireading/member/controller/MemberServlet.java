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
import org.iii.eeit9503.ireading.member.bean.PaymentBean;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.member.model.OutputService;
import org.iii.eeit9503.ireading.member.model.PaymentService;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.iii.eeit9503.ireading.order.model.OrderStatusService;
import org.iii.eeit9503.ireading.order.model.PayService;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;


@WebServlet("/member.servlet")
public class MemberServlet extends HttpServlet {
	private MemberService memberService;
	private OutputService outputService;
	private PaymentService paymentService;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		memberService = (MemberService) context.getBean("memberService");
		outputService = (OutputService) context.getBean("outputService");
		paymentService = (PaymentService) context.getBean("paymentService");
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

//--------------------------------------------------------------
		//Payment
		//insert
//		PaymentBean bean=new PaymentBean();
//		bean.setProductID("B000000020");
//		bean.setMemberID("M170000020");
//		bean.setAmount(752);
//		bean.setPaytime(new DateTansfer().Now());
//		int update=paymentService.insert(bean);
//        System.out.println(update);
		
		//update
//		PaymentBean bean=new PaymentBean();
//		bean.setProductID("B000000020");
//		bean.setMemberID("M170000020");
//		bean.setAmount(752);
//		bean.setPaytime(new DateTansfer().Now());
//		int update=paymentService.update(bean);
//        System.out.println(update);
		
		//delete
//		int update=paymentService.delete("B000000020");
//        System.out.println(update);
		
		//findByProductID
//		PaymentBean bean=paymentService.findByProductID("B000000019");
//      System.out.println(bean.getProductID()+":"+bean.getAmount()+":"+bean.getPaytime());
        
		//findByMemberID
//		List<PaymentBean> list=paymentService.findByMemberID("M170000012");
//		for(PaymentBean bean:list){
//		System.out.println(bean.getProductID()+":"+bean.getAmount()+":"+bean.getPaytime());
//		}
		
		//getAll
//		List<PaymentBean> list=paymentService.getAll();
//		for(PaymentBean bean:list){
//		System.out.println(bean.getProductID()+":"+bean.getAmount()+":"+bean.getPaytime());
//		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
