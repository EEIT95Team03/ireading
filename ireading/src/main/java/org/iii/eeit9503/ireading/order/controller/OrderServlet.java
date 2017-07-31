package org.iii.eeit9503.ireading.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.iii.eeit9503.ireading.order.model.OrderStatusService;
import org.iii.eeit9503.ireading.order.model.PayService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(
        urlPatterns={"/order.servlet"}
       )
public class OrderServlet extends HttpServlet{
	
	private OrderService orderService;
	private OrderDetailService orderDetailService;
	private PayService payService;
	private OrderStatusService orderStatusService;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		orderService = (OrderService) context.getBean("orderService");
		orderDetailService = (OrderDetailService) context.getBean("orderDetailService");
		payService=(PayService)context.getBean("payService");
		orderStatusService=(OrderStatusService)context.getBean("orderStatusService");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//super.doGet(req, resp);
		
		//OrderBean
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
		//System.out.println(new Timestamp(new java.util.Date().getTime()));
//----------------------------------------------------
		//OrderDetail
		
		
		//insert
//		bean.setOrderID("O170720001");
//	    bean.setProductID("B000000002");
//	    int update=orderDetailService.insert(bean);
//	    System.out.println(update);
		
		//update
//		ODBean bean=new ODBean();
//	       bean.setOrderID("O170720001");
//	       bean.setProductID("B000000020");
//	       int update=orderDetailService.update(bean);
//	       System.out.println(update);
		
		//delete1
//	    bean.setOrderID("O170720001");
//	    bean.setProductID("B000000002");		
//	    int update=orderDetailService.delete(bean);
		//delete2
//		int update=orderDetailService.delete("O170720001","B000000020");
//	    System.out.println(update);
		

		
		//findByOrderID
//		List<OrderDetailBean> list=orderDetailService.findByOrderID("O170720001");
//		for(OrderDetailBean bean2:list){
//			System.out.println(bean2.getOrderID()+":"+bean2.getProductID());
//		}

		
		//findByProductID
//		List<OrderDetailBean> list=orderDetailService.findByProductID("B000000004");
//		for(OrderDetailBean bean2:list){
//			System.out.println(bean2.getOrderID()+":"+bean2.getProductID());
//		}

		
		
//		List<ODBean> list=odService.getAll();
//		for(ODBean bean2:list){
//			System.out.println(bean2.getOrderID()+":"+bean2.getProductID());
//		}


		//getAll
//		List<OrderDetailBean> list=orderDetailService.getAll();
//		for(OrderDetailBean bean2:list){
//			System.out.println(bean2.getOrderID()+":"+bean2.getProductID());
//		}

		
		//pay
		//insert
//		PayBean bean=new PayBean();
//		bean.setPayID("p0003");
//		bean.setPayType("貨到付款");
//		int update=payService.insert(bean);
//		System.out.println(update);
		
		//update
//		PayBean bean=new PayBean();
//		bean.setPayID("p0003");
//		bean.setPayType("貨到付款2");
//		int update=payService.update(bean);
//		System.out.println(update);
	
		//delete
//		int update=payService.delete("p0003");
//		System.out.println(update);
		
		//findByID
//		PayBean bean=payService.findByID("p0002");
//		System.out.println(bean.getPayID()+":"+bean.getPayType());
		
		
		//getAll
//		List<PayBean> list=payService.getAll();
//		for(PayBean bean2:list){
//			System.out.println(bean2.getPayID()+":"+bean2.getPayType());
//		}
		
//------------------------------------------------------------		
		//OrderStatus
		//insert
//		OrderStatusBean bean=new OrderStatusBean();
//		bean.setStatusID("OS007");
//		bean.setStatusName("測試中");		
//		int update=orderStatusService.insert(bean);
//		System.out.println(update);
		
		//update
//		OrderStatusBean bean=new OrderStatusBean();
//		bean.setStatusID("OS007");
//		bean.setStatusName("測試中2");		
//		int update=orderStatusService.update(bean);
//		System.out.println(update);
		
		//delete
//		int update=orderStatusService.delete("OS007");
//		System.out.println(update);
		
		//findByID
//		OrderStatusBean bean=orderStatusService.findByID("OS001");
//		System.out.println(bean.getStatusID()+":"+bean.getStatusName());
//		
//		
//		//getAll
//		List<OrderStatusBean> list=orderStatusService.getAll();
//		for(OrderStatusBean bean2:list){
//			System.out.println(bean2.getStatusID()+":"+bean2.getStatusName());
//		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	

}
