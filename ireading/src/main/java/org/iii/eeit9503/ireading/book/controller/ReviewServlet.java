package org.iii.eeit9503.ireading.book.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.iii.eeit9503.ireading.book.model.ReviewService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(urlPatterns = { "/review.controller" })
public class ReviewServlet extends HttpServlet {

	private ReviewService reviewService;

	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext) application
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		reviewService = (ReviewService) context.getBean("reviewService");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Servlet順利執行");// 此為測試用，用來確認Servlet有順利被執行

		// insert
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		ReviewBean bean = new ReviewBean();
//		bean.setMemberID("M170000011");
//		bean.setISBN("9789861754604");
//		bean.setRate(3);
//		bean.setContent("GOOOOOOOOOOOOOOOOOOOOOOOOOD!");	
//		try {
//			bean.setPostTime(new Timestamp(sdf.parse("1999-11-11 01:22:33").getTime()));
//			//sdf.parse得到日期 .getTime換成秒數
//		} catch (ParseException e) {			
//			e.printStackTrace();
//		}
//		int update=reviewService.insert(bean);
//		System.out.println(update);

		// update
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		ReviewBean bean = new ReviewBean();
//		bean.setMemberID("M170000011");
//		bean.setISBN("9789861754604");
//		bean.setRate(3);
//		bean.setContent("GOOD!");	
//		try {
//			bean.setPostTime(new Timestamp(sdf.parse("1999-11-11 10:22:10").getTime()));
//			//sdf.parse得到日期 .getTime換成秒數
//		} catch (ParseException e) {			
//			e.printStackTrace();
//		}
//		int update=reviewService.update(bean);
//		System.out.println(update); 
//		
		
		// delete
//		 int delete = reviewService.delete("M170000011","9789861754604");
//		 System.out.println("--" + delete + "--");


//		// getAll
//		 List<ReviewBean> list = reviewService.getAll();
//		 for (ReviewBean bean : list) {
//		 System.out.println(bean.getMemberID() + ": " + bean.getISBN()+":"+bean.getContent());
//		 }
		 
	}

	@Override
	protected void doPost(HttpServletRequest Request, HttpServletResponse Response)
			throws ServletException, IOException {

		this.doGet(Request, Response);
	}

}
