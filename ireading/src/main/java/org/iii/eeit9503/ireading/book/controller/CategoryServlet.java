package org.iii.eeit9503.ireading.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.book.bean.CategoryBean;
import org.iii.eeit9503.ireading.book.model.CategoryService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(urlPatterns = { "/category.servlet" })
public class CategoryServlet extends HttpServlet {

	private CategoryService categoryService;

	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext) application
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		categoryService = (CategoryService) context.getBean("categoryService");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Servlet順利執行");// 此為測試用，用來確認Servlet有順利被執行

		// insert
//		CategoryBean bean = new CategoryBean();
//		bean.setCategoryID("001");
//		bean.setCategoryName("總類2");
//
//		int insert = categoryService.insert(bean);
//		System.out.println("--" + insert + "--");

		// update
//		CategoryBean bean = new CategoryBean();
//		bean.setCategoryID("001");
//		bean.setCategoryName("總類3");
//		
//		 int update = categoryService.update(bean);
//		 System.out.println("--" + update + "--");
		 
		// delete
//		 int delete = categoryService.delete("001");
//		 System.out.println("--" + delete + "--");

		// findByID
//		 CategoryBean bean = categoryService.findByID("000");
//		 System.out.println(bean.getCategoryID() + ": " + bean.getCategoryName());

		// selectAll (Hibernate page.90)
//		 List<CategoryBean> list = categoryService.getAll();
//		 for (CategoryBean bean : list) {
//		 System.out.println(bean.getCategoryID() + ": " + bean.getCategoryName());
//		 }
	}

	@Override
	protected void doPost(HttpServletRequest Request, HttpServletResponse Response)
			throws ServletException, IOException {

		this.doGet(Request, Response);
	}

}
