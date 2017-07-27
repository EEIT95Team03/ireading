package org.iii.eeit9503.ireading.controller;
import java.io.IOException;
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
	       
	        System.out.println("Servlet順利執行");//此為測試用，用來確認Servlet有順利被執行

//	        BookCase書櫃測試
	        
//insert
//	        BookCaseBean bean = new BookCaseBean();
//	        bean.setMemberID("M170000003");
//	        bean.setBCID("BC00000007");
//	        bean.setBCName("測試緣緣堂");
//	        bean.setCaseRank(true);
//	        bean.setDisplay(true);
//	        BookCaseDAO dao = new BookCaseDAO();
//	        int insert = dao.insert(bean);
//	        System.out.println("insert---"+insert+"---");	        
//update
//	        BookCaseBean bean = new BookCaseBean();
///	        bean.setMemberID("M170000003");
//	        bean.setBCID("BC00000007");
//	        bean.setBCName("緣緣堂");
//	        bean.setCaseRank(false);
//	        bean.setDisplay(false);
//	        BookCaseDAO dao = new BookCaseDAO();
//	        int update = dao.update(bean);
//	        System.out.println("update---"+update+"---");	        
//delete
//	        BookCaseDAO dao=new BookCaseDAO();
//	        int delete=dao.delete("BC00000007");
//	        System.out.println("delete---"+delete+"---");
//findByID
//	        BookCaseDAO dao=new BookCaseDAO();
//	        BookCaseBean bean=dao.findByPK("BC00000007");
//	        System.out.println(bean.getMemberID()+":"+bean.getBCID()+":"+bean.getBCName()+":"+bean.CaseRank()+":"+bean.Display());	        
//selectAll
//	        BookCaseDAO dao=new BookCaseDAO();
//	        List<BookCaseBean> list=dao.getAll();
//	        for(BookCaseBean bean:list){
//	        System.out.println(bean.getMemberID()+":"+bean.getBCID()+":"+bean.getBCName()+":"+bean.CaseRank()+":"+bean.Display());		        
// 			}
	        
	        
	        
	        
	        
	        
	        
	        
//	        BCDetail書櫃清單測試
	        
//insert
//	        BCDetailBean bean = new BCDetailBean();
//	        bean.setBCID("BC00000007");
//	        bean.setISBN("9789869452809");
//	        bean.setBookRank((short) 0);
//	        BCDetailDAO dao = new BCDetailDAO();
//	        int insert = dao.insert(bean);
//	        System.out.println("insert---"+insert+"---");	        
//update
//	        BCDetailBean bean = new BCDetailBean();
//	        bean.setBCID("BC00000007");
//	        bean.setISBN("9789869458023");
//	        bean.setBookRank((short) 0);
//	        BCDetailDAO dao = new BCDetailDAO();
//	        int update = dao.update(bean);
//	        System.out.println("update---"+update+"---");	        
//delete
//	        BCDetailDAO dao=new BCDetailDAO();
//	        int delete=dao.delete("9999");
//	        System.out.println("delete---"+delete+"---");
//findByID
//	        BCDetailDAO dao=new BCDetailDAO();
//	        BCDetailBean bean=dao.findByPK("9999");
//	        System.out.println(bean.getBCID()+":"+bean.getISBN()+":"+bean.getBookRank());	        
//selectAll
//	        BCDetailDAO dao=new BCDetailDAO();
//	        List<BCDetailBean> list=dao.getAll();
//	        for(BCDetailBean bean:list){
//	        System.out.println(bean.getBCID()+":"+bean.getISBN()+":"+bean.getBookRank());	        
// 			}
	        
	        
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
	        OrderDAO dao=new OrderDAO();
	        List<OrderBean> list=dao.getAll();
	        for(OrderBean bean:list){
	        	System.out.println(bean.getOrderID()+":"+bean.getMemberID()+":"+bean.getOaddr());
	        }
      
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	       
	       this.doGet(req, resp);
	    }

}
