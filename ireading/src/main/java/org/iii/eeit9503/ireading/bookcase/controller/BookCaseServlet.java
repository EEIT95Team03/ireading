package org.iii.eeit9503.ireading.bookcase.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.bookcase.model.BCDetailService;
import org.iii.eeit9503.ireading.bookcase.model.BookCaseService;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.iii.eeit9503.ireading.order.model.OrderStatusService;
import org.iii.eeit9503.ireading.order.model.PayService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;


@WebServlet("/BookCaseServlet")
public class BookCaseServlet extends HttpServlet {
	private BookCaseService bookCaseService;
	private BCDetailService bCDetailService;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		bookCaseService = (BookCaseService) context.getBean("bookCaseService");	
		bCDetailService = (BCDetailService) context.getBean("BCDetailService");	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//BookCaseBean
		//insert
//		BookCaseBean bean = new BookCaseBean();
//						bean.setBCID("BC00000010");
//				bean.setMemberID("M170000004");
//				bean.setBCName("書櫃名稱");
//				bean.setCaseRank(0);
//				bean.setDisplay(1);
//				int update=bookCaseService.insert(bean);
//				System.out.println(update);
				
				
				//update
//				BookCaseBean bean = new BookCaseBean();
//								bean.setBCID("BC00000010");
//						bean.setMemberID("M170000004");
//						bean.setBCName("書櫃名稱2");
//						bean.setCaseRank(0);
//						bean.setDisplay(1);
//						int update=bookCaseService.update(bean);
//						System.out.println(update);
		
		//deldte
//		int update=bookCaseService.delete("BC00000010");
//		System.out.println(update);
		
		//findByID
//		BookCaseBean bean=bookCaseService.findByID("BC00000001");
//		System.out.println(bean.getBCID()+":"+bean.getBCName());

		
		//getAll
//		List<BookCaseBean> list=bookCaseService.getAll();
//		for(BookCaseBean bean:list){System.out.println(bean.getBCID()+":"+bean.getBCName());}
		
//------------------------------------------------------------
		//BCDetail
		
		//insert
//		BCDetailBean bean = new BCDetailBean(); 
//				bean.setISBN("9789869458023");
//				bean.setBCID("BC00000004");		
//				bean.setBookRank(1);
//				int update=bCDetailService.insert(bean);
//				System.out.println(update);

		//update
//		BCDetailBean bean = new BCDetailBean(); 
//				bean.setISBN("9789869458023");
//				bean.setBCID("BC00000004");		
//				bean.setBookRank(0);
//				int update=bCDetailService.update(bean);
//				System.out.println(update);
		//delete
//		int update=bCDetailService.delete("9789869458023", "BC00000004");
//	System.out.println(update);

		
		//findbyBCID
//		List<BCDetailBean> list=bCDetailService.findByBCID("BC00000004");
//        for(BCDetailBean bean:list){
//        	System.out.println(bean.getBCID()+":"+bean.getISBN()+":"+bean.getBookRank());
//        }
		
		//getAll
//		List<BCDetailBean> list=bCDetailService.getAll();
//      for(BCDetailBean bean:list){
//      	System.out.println(bean.getBCID()+":"+bean.getISBN()+":"+bean.getBookRank());
//      }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
