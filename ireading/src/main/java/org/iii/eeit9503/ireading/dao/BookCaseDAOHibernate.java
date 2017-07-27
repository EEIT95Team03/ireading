package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.BookCaseBean;

public class BookCaseDAOHibernate implements BookCaseDAO{
	
	private static final String GET_ALL_STMT="from BookCaseBean order by BCID";	
	private Session session;	

	public static void main(String[] args) {
		BookCaseDAOHibernate dao = new BookCaseDAOHibernate();
		BookCaseBean bean = new BookCaseBean();
		
//insert
//		bean.setBCID("BC00000010");
//		bean.setMemberID("M170000004");
//		bean.setBCName("書櫃名稱");
//		bean.setCaseRank(0);
//		bean.setDisplay(1);
//		dao.insert(bean);
		
//update		
//		bean.setBCID("BC00000010");
//		bean.setMemberID("M170000003");
//		bean.setBCName("書櫃名稱WWWWWWWW");		
//		dao.update(bean);
		
//delete
//		bean.setBCID("BC00000010");
//		bean.setMemberID("M170000004");
//		bean.setBCName("書櫃名稱");
//		bean.setCaseRank(0);
//		bean.setDisplay(1);
//		dao.delete("BC00000010");
		
		List<BookCaseBean>list = dao.getAll();
		for(BookCaseBean o:list){
			System.out.println(o.getBCID()+", "+o.getMemberID()+", "+o.getBCName()+", "+o.getCaseRank()+", "+o.getDisplay());
		}
		

	}

	@Override
	public void insert(BookCaseBean bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public void update(BookCaseBean bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public void delete(String BCID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			BookCaseBean bean = (BookCaseBean)session.get(BookCaseBean.class, BCID);
			session.delete(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}		
	}

	@Override
	public BookCaseBean findByID(String BCID) {
		try {
			BookCaseBean bean = session.get(BookCaseBean.class, BCID);
			return bean;
		} catch (RuntimeException e) {			
			e.printStackTrace();
			return null;
		}		
	}

	@Override
	public List<BookCaseBean> getAll() {
		List<BookCaseBean>list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
			return list;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return list;
		}
		
	}

}
