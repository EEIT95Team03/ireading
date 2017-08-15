package org.iii.eeit9503.ireading.event.dao;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.event.bean.EventBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOHibernate implements EventDAO {

	public static final String get_Evnetlist = "from EventBean";
	public static final String get_LastID ="select top 1 EventID from Event order by EventID DESC";

	@Autowired
	private SessionFactory sessionFactory = null;

	@Autowired
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public EventBean select(String EventID) {
		return this.getSession().get(EventBean.class, EventID);
	}

	@Override
	public List<EventBean> select() {
		Query query = this.getSession().createQuery(get_Evnetlist);
		List<EventBean> list = query.list();
		return list;
	}

	// public List<EventBean> select() {
	// return this.getSession().createQuery(
	// "from EventBean", EventBean.class).getResultList();
	// }

	@Override
	public int insert(EventBean eventBean) {
		try {

			Session session = this.getSession();
			EventBean bean = session.get(EventBean.class, eventBean.getEventID());

			if (bean == null) {
				session.saveOrUpdate(eventBean);

				return 1;
			}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public EventBean update(EventBean eventBean) {

		try {
			Session session = this.getSession();

			session.update(eventBean);

			return eventBean;

		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int delete(String EventID) {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("delete from EventBean where EventID=?");
			System.out.println(EventID);
			query.setParameter(0, EventID);
			int delete = query.executeUpdate();
			System.out.println("success");
			return delete;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("failed");
			return 0;
		}
	}

	// 流水號
	@Override
	public String getLastID() {
		Query query = this.getSession().createSQLQuery(get_LastID);
		List<Object> list = query.list();
		String LastID = null;
		for (Object id : list) {
			LastID = (String) id;
		}
		int num = Integer.parseInt(LastID.substring(3));
		Calendar cal=Calendar.getInstance(Locale.TAIWAN);
		cal.setTime(new java.util.Date());
		String y=String.valueOf(cal.get(cal.YEAR)).substring(2);
		String snum="00"+(num+1);
		String fnum ="E"+y+snum.substring(snum.length()-3);
	
		System.out.println(fnum);
		return fnum;
	}

	@Override
	public EventBean findByEventID(String EventID) {
		try {
			Session session = this.getSession();
			EventBean bean = session.get(EventBean.class, EventID);

			return bean;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("failed");
			return null;
		}

	}

}
