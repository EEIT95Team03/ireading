package org.iii.eeit9503.ireading.event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.event.bean.EventBean;
import org.iii.eeit9503.ireading.event.bean.JoinListBean;
import org.iii.eeit9503.ireading.event.model.EventService;
import org.iii.eeit9503.ireading.event.model.JoinListService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(
		urlPatterns = { "/event.servlet" }
		)
public class EventServlet extends HttpServlet {

	private EventService eventService;
	private JoinListService joinlistService;

	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext) application
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		eventService = (EventService) context.getBean("eventService");
		joinlistService = (JoinListService) context.getBean("joinListService");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Servlet順利執行");
		
		//event
		//getAll
//		List<EventBean> list=eventService.getAll();
//		for(EventBean bean:list){
//			System.out.println(bean.getEventID()+":"+bean.getEventName());
//		}
		
//---------------------------------------------
		//joinlist
//		List<JoinListBean> list=joinlistService.getAll();
//		for(JoinListBean bean:list){
//			System.out.println(bean.getEventID()+":"+bean.getEventID());
//		}	
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		super.doPost(req, resp);
	}

}
