package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.BookCaseBean;

public class BookCaseDAO {
	// insert
		public int insert(BookCaseBean bookCaseBean) {
			try {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				session.saveOrUpdate(bookCaseBean);
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
		public int update(BookCaseBean bookCaseBean) {
			try {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				session.saveOrUpdate(bookCaseBean);
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
		public int delete(String BCID) {
			try {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();

				Query query = session.createQuery("delete from BookCaseBean where BCID =?");
				query.setParameter(0, BCID);
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
		public BookCaseBean findByPK(String BCID) {
			try {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();

				BookCaseBean bean = session.get(BookCaseBean.class, BCID);

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
		public List<BookCaseBean> getAll() {
			try {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();

				Query query = session.createQuery("from BookCaseBean");
				List<BookCaseBean> list = query.list();

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
