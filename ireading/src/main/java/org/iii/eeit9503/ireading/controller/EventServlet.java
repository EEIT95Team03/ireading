package org.iii.eeit9503.ireading.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.model.EventService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;


@WebServlet(
		urlPatterns={"/event.controller"}
		)
public class EventServlet extends HttpServlet {
	
	private EventService eventService;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		eventService = (EventService) context.getBean("eventService");
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Servlet順利執行");
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
//		EventBean bean=new OrderBean();
//		bean.setEventID("O170726006");
//			
//		int update=eventDAO.insert(bean);
//		System.out.println("--"+update+"--");
//		
//		List<EventBean> list=orderService.getAll();
//		for(EventBean ebean:list){
//			System.out.println(ebean.getEvnetID());
//		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doGet(req, resp);
	}

}
