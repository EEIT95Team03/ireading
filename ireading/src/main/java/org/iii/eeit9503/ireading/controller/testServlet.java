package org.iii.eeit9503.ireading.controller;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.dao.OrderDAO;

import org.iii.eeit9503.ireading.model.OrderBean;

@WebServlet(
        urlPatterns={"/test.controller"}
       )

public class testServlet extends HttpServlet{
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       // TODO Auto-generated method stub
	        System.out.println("Servlet順利執行");//此為測試用，用來確認Servlet有順利被執行

	     //已下為Order測試程式
	        //insert
//	        OrderBean bean=new OrderBean();
//			bean.setOrderID("O170726002");
//			bean.setPayID("P0001");
//			bean.setMemberID("M170000007");
//			bean.setStatusID("OS001");
//			bean.setInvoice("SR89510541");
//			bean.setOaddr("台北市松山區健康路243號8樓");
//			bean.setOdate(new Date(new java.util.Date().getTime()));
//			bean.setOtotal(123);
//			bean.setOmemo(null);
//			bean.setReciepient("張景一");			
//			OrderDAO dao=new OrderDAO();
//			int update=dao.insert(bean);
//	        System.out.println("--"+update+"--");
	        
	        
	        
	        //update
//	        OrderBean bean=new OrderBean();
//			bean.setOrderID("O170726001");
//			bean.setPayID("P0001");
//			bean.setMemberID("M170000007");
//			bean.setStatusID("OS001");
//			bean.setInvoice("SR89510541");
//			bean.setOaddr("台北市松山區健康路243號8樓");
//			bean.setOdate(new Date(new java.util.Date().getTime()));
//			bean.setOtotal(12345);
//			bean.setOmemo(null);
//			bean.setReciepient("張景一");			
//			OrderDAO dao=new OrderDAO();
//			int update=dao.update(bean);
//			System.out.println(update);
	        
	        //delete
//	        OrderDAO dao=new OrderDAO();
//	        int update=dao.delete("O170726001");
//	        System.out.println(update);
	        
	        //findByID
//	        OrderDAO dao=new OrderDAO();
//	        OrderBean bean=dao.findByPK("O170720001");
//	        System.out.println(bean.getOrderID()+":"+bean.getMemberID()+":"+bean.getOaddr());
	        
	        //selectAll
//	        OrderDAO dao=new OrderDAO();
//	        List<OrderBean> list=dao.getAll();
//	        for(OrderBean bean:list){
//	        	System.out.println(bean.getOrderID()+":"+bean.getMemberID()+":"+bean.getOaddr());
	       // }
	        
	        
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	       // TODO Auto-generated method stub
	       this.doGet(req, resp);
	    }

}
