package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.EventBean;

public class EventDAO {

	public int insert(EventBean eventbean) {

		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			session.saveOrUpdate(eventbean);

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return 1;
		} catch (Exception e) {

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return 0;
		} finally {

			HibernateUtil.closeSessionFactory();
		}
	}

	public int update(EventBean eventbean) {

		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			session.saveOrUpdate(eventbean);

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return 1;
		} catch (Exception e) {

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return 0;
		} finally {

			HibernateUtil.closeSessionFactory();
		}
	}

	public int delete(String id) {
		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			Query query = session.createQuery("delete from EventBean where EventID=?");
			query.setParameter(0, id);
			int delete = query.executeUpdate();

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return delete;
		} catch (Exception e) {

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return 0;
		} finally {

			HibernateUtil.closeSessionFactory();
		}
	}

	public EventBean findByPK(String id) {
		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			EventBean bean = session.get(EventBean.class, id);

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return bean;
		} catch (Exception e) {

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return null;
		} finally {

			HibernateUtil.closeSessionFactory();
		}

	}

	public List<EventBean> getAll() {
		Session session = null;
		try {

			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			Query query = session.createQuery("from EventBean");
			List<EventBean> list = query.list();

			session.getTransaction().commit();
			return list;
		} catch (Exception e) {

			session.getTransaction().rollback();
			return null;
		} finally {

		}

	}

	public static void main(String[] args) {
		EventDAO dao = new EventDAO();
		List<EventBean> list = dao.getAll();

		for (EventBean bean : list) {
			System.out.println(
					bean.getEventID() + ":" + bean.getEventName() + ":" + bean.getEventDate() + ":" + bean.getHost()
							+ ":" + bean.getEventPhone() + ":" + bean.getEventPlace() + ":" + bean.getEventImg() + ":"
							+ bean.getDeadline() + ":" + bean.getEventContent() + ":" + bean.getMax());
		}
	}
}