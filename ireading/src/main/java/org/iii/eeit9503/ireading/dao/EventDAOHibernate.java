package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.model.EventBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOHibernate implements EventDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(EventBean eventbean) {

		try {

			Session session = this.getSession();

			EventBean bean = session.get(EventBean.class, eventbean.getEventID());

			if (bean == null) {
				session.saveOrUpdate(eventbean);

				return 1;
			}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int update(EventBean eventbean) {

		try {
			Session session = this.getSession();

			session.saveOrUpdate(eventbean);

			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}

	@Override
	public int delete(String EventID) {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("delete from EvnetBean where EventID=?");
			query.setParameter(0, EventID);
			int delete = query.executeUpdate();

			return delete;
		} catch (Exception e) {
			// TODO: handle exception

			return 0;
		}
	}

	@Override
	public EventBean findByID(String EventID) {
		try {
			Session session = this.getSession();

			EventBean bean = session.get(EventBean.class, EventID);

			return bean;
		} catch (Exception e) {

			return null;
		}

	}

	@Override
	public List<EventBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from EventBean");
			List<EventBean> list = query.list();

			return list;
		} catch (Exception e) {
			return null;
		}
	}

}
