package org.iii.eeit9503.ireading.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.model.EventService;
import org.iii.eeit9503.ireading.model.JoinListBean;
import org.iii.eeit9503.ireading.model.JoinListService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(
		urlPatterns = { "/event.controller" }
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
		
		// 以下為Event測試程式

//	super.doGet(req, resp);
//		 bean.setEventID("E17999");
//		 bean.setEventName("測試活動標題01");;
//		 bean.setEventDate(java.sql.Date.valueOf("2017-11-11"));
//		 bean.setHost("享。閱");
//		 bean.setEventPhone("0911111111");
//		 bean.setEventPlace("台北大安");
//		 bean.setEventImg(null);
//		 bean.setEventDate(java.sql.Date.valueOf("2017-11-30"));
//		 bean.setEventContent("活動內容詳情");
//		 bean.setMax(350);	
//		int update=eventDAO.insert(bean);
//		System.out.println("--"+update+"--");
//		
//		List<EventBean> list=eventService.getAll();
//		for(EventBean ebean:list){
//			System.out.println(ebean.getEventID());
//		}
		
//		EventBean bean2=new EventBean();
//		bean2.setEventID("E17999");
//		List<EventBean> list2=eventDAO.select(bean2);
//		System.out.println("----ebean----");
//		for(EventBean ebean:list2){
//			System.out.println("----ebean----");
//			System.out.println(ebean.getEventID());
//		}
		
//----------------------------------------------------
		//OrderDetail
		
//		JoinListBean bean=new JoinListBean();
		
		//delete1
//	    bean.setEventID("");
//	    bean.setMemberID("");		
//	    int update=joinlistService.delete(bean);
		//delete2
//		int update=joinlistService.delete("O170720001","B000000002");
//	    System.out.println(update);
		
		//update
//		JoinListBean bean=new JoinListBean();
//	       bean.setEventID("");
//	       bean.setMemberID("");
//	       int update=joinlistService.update(bean);
//	       System.out.println(update);
		
		//findByEventID
//		List<JoinListBean> list=odService.findByEventID("");
//		for(JoinListBean bean2:list){
//			System.out.println(bean2.getEventID()+":"+bean2.getMemberID());
//		}

		
		//findByMemberID
//		List<JoinListBean> list=odService.findByMemberID("");
//		for(JoinListBean bean2:list){
//			System.out.println(bean2.getEventID()+":"+bean2.getMemberID());
//		}
		
//		List<JoinListBean> list=joinlistService.getAll();
//		for(JoinListBean bean2:list){
//			System.out.println(bean2.getEventID()+":"+ bean2.getMemberID());
//		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		super.doPost(req, resp);
	}

}
