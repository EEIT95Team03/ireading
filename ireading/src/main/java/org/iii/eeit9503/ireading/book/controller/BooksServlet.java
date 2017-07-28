package org.iii.eeit9503.ireading.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(urlPatterns = { "/books.controller" })
public class BooksServlet extends HttpServlet {

	private BooksService booksService;

	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext) application
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		booksService = (BooksService) context.getBean("booksService");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Servlet順利執行");// 此為測試用，用來確認Servlet有順利被執行

		// insert
//		BooksBean bean = new BooksBean();
//		bean.setISBN("9789570530630");
//		bean.setCategoryID("000");
//		bean.setTitle("如何閱讀一本書2222");
//		bean.setCover(null);
//		bean.setAuthor("莫提默‧艾德勒、查理‧范多倫");
//		bean.setPublisher("臺灣商務印書館股份有限公司");
//		bean.setLanguage(0);
//		bean.setPub_Date(new java.sql.Date(2016 / 12 / 01));
//		bean.setOri_Price(480);
//		bean.setAbstract("001");
//		bean.setClick(0);
//		bean.setRateAvg(0.0);
//
//		int insert = booksService.insert(bean);
//		System.out.println("--" + insert + "--");

		// update
//		BooksBean bean = new BooksBean();
//		bean.setISBN("9789570530630");
//		bean.setCategoryID("000");
//		bean.setTitle("如何閱讀一本書333");
//		bean.setCover(null);
//		bean.setAuthor("莫提默‧艾德勒、查理‧范多倫");
//		bean.setPublisher("臺灣商務印書館股份有限公司");
//		bean.setLanguage(0);;
//		bean.setPub_Date(new java.sql.Date(2016 / 12 / 01));
//		bean.setOri_Price(480);
//		bean.setAbstract("001");
//		bean.setClick(0);
//		bean.setRateAvg(0.0);;
//		
//		 int update = booksService.update(bean);
//		 System.out.println("--" + update + "--");
//		 
		// delete
//		 int delete = booksService.delete("9789570530630");
//		 System.out.println(delete);

		// findByID
//		 BooksBean bean = booksService.findByID("9789570530629");
//		 System.out.println(bean.getISBN() + "\t" + bean.getCategoryID() +
//		 "\t" + bean.getTitle() + "\t"
//		 + bean.getCover() + "\t" + bean.getAuthor() + "\t" +
//		 bean.getPublisher() + "\t" + bean.getLanguage()
//		 + "\t" + bean.getPub_Date() + "\t" + bean.getOri_Price() + "\t" +
//		 bean.getAbstract() + "\t"
//		 + bean.getClick() + "\t" + bean.getRateAvg());

		// selectAll (Hibernate page.90)
//		 List<BooksBean> list = booksService.getAll();
//		 for (BooksBean bean : list) {
//		 System.out.println(bean.getISBN() + "\t" + bean.getCategoryID() +
//		 "\t" + bean.getTitle() + "\t"
//		 + bean.getCover() + "\t" + bean.getAuthor() + "\t" +
//		 bean.getPublisher() + "\t" + bean.getLanguage()
//		 + "\t" + bean.getPub_Date() + "\t" + bean.getOri_Price() + "\t" +
//		 bean.getAbstract() + "\t"
//		 + bean.getClick() + "\t" + bean.getRateAvg());
//		 }
	}

	@Override
	protected void doPost(HttpServletRequest Request, HttpServletResponse Response)
			throws ServletException, IOException {

		this.doGet(Request, Response);
	}

}
