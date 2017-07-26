package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.BCDetailBean;

public class BCDetailDAO {

	// insert
	public int insert(BCDetailBean bCDetailBean) {
		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.saveOrUpdate(bCDetailBean);
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return 1;
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return 0;
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	// update
	public int update(BCDetailBean bCDetailBean) {
		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.saveOrUpdate(bCDetailBean);
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			;
			return 1;
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return 0;
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	// delete
	public int delete(String isbn) {
		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			Query query = session.createQuery("delete from BCDetailBean where ISBN =?");
			query.setParameter(0, isbn);
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

	// find 1
	public BCDetailBean findByPK(String isbn) {
		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			BCDetailBean bean = session.get(BCDetailBean.class, isbn);

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return bean;
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return null;
		} finally {
			HibernateUtil.closeSessionFactory();
		}

	}

	// find all
	public List<BCDetailBean> getAll() {
		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			Query query = session.createQuery("from BCDetailBean");
			List<BCDetailBean> list = query.list();

			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return list;
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return null;
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
}