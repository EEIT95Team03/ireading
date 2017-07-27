package org.iii.eeit9503.ireading.order.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.dao.OrderDAOHibernate;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(
        urlPatterns={"/order.controller"}
       )
public class OrderServlet extends HttpServlet{
	
	private OrderService orderService;
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		orderService = (OrderService) context.getBean("orderService");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
//		OrderBean bean=new OrderBean();
//		bean.setOrderID("O170726006");
//		bean.setPayID("P0001");
//		bean.setMemberID("M170000007");
//		bean.setStatusID("OS001");
//		bean.setInvoice("SR89510541");
//		bean.setOaddr("台北市松山區健康路243號8樓");
//		bean.setOdate(new Date(new java.util.Date().getTime()));
//		bean.setOtotal(123);
//		bean.setOmemo(null);
//		bean.setReciepient("張景一");			
//		int update=orderDAO.insert(bean);
//		System.out.println("--"+update+"--");
//		
		List<OrderBean> list=orderService.getAll();
		for(OrderBean obean:list){
			System.out.println(obean.getOrderID()+":"+obean.getReciepient()+":"+obean.getOaddr());
		}
		
//		OrderBean bean2=new OrderBean();
//		bean2.setOrderID("O170701001");
//		List<OrderBean> list2=orderDAO.select(bean2);
//		System.out.println("----obean----");
//		for(OrderBean obean:list2){
//			System.out.println("----obean----");
//			System.out.println(obean.getOrderID());
//		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	

}