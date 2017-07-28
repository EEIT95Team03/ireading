package org.iii.eeit9503.ireading.bookcase.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookCaseDAOHibernate implements BookCaseDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	private static final String GET_ALL_STMT = "from BookCaseBean order by BCID";

	@Override
	public int insert(BookCaseBean bean) {	
		try {
			
			Session session = this.getSession();
			
			session.saveOrUpdate(bean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	@Override
	public int update(BookCaseBean bean) {
		try {
			Session session = this.getSession();
			
			session.saveOrUpdate(bean);
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int delete(String BCID) {

		try {
			Session session = this.getSession();
			BookCaseBean bean = (BookCaseBean) session.get(BookCaseBean.class, BCID);
			session.delete(bean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public BookCaseBean findByID(String BCID) {
		try {
			Session session = this.getSession();
			BookCaseBean bean = session.get(BookCaseBean.class, BCID);
			return bean;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<BookCaseBean> getAll() {
		try {
			Session session = this.getSession();
			Query query = session.createQuery(GET_ALL_STMT);
			List<BookCaseBean> list = query.list();
			return list;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		}

	}

}
