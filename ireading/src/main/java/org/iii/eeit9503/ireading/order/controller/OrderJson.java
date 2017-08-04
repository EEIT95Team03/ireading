package org.iii.eeit9503.ireading.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(
        urlPatterns={"/order.json"}
       )
public class OrderJson extends HttpServlet{	
	private OrderService orderService;

	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		orderService = (OrderService) context.getBean("orderService");}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8"); 
		String OrderID=request.getParameter("OrderID");
		PrintWriter out = response.getWriter();
		OrderBean bean=orderService.findByID(OrderID);
		 JSONArray jarray = new JSONArray();
		 
			 JSONObject obj = new JSONObject();
			 obj.put("orderid", bean.getOrderID());
			 obj.put("orderdate", bean.getOdate());
			 obj.put("memberid", bean.getMemberID());
			 obj.put("invoice", bean.getInvoice());
			 obj.put("status", bean.getOrderStatusBean().getStatusID());
			 obj.put("pay", bean.getPayBean().getPayID());
			 obj.put("reciepient", bean.getReciepient());
			 obj.put("addr", bean.getOaddr());
			 obj.put("memo", bean.getOmemo());
			 obj.put("total", bean.getOtotal());			 
			 jarray.put(obj);
		 
		 String str=jarray.toString();
		 System.out.println(str);
		 out.print(str);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	

}
