package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.BCDetailBean;

public class BCDetailDAOHibernate implements BCDetailDAO {
	
	public static final String GET_ALL_STMT="from BCDetailBean order by BCID";
	private Session session;
	
	public static void main(String[] args){
		BCDetailDAOHibernate dao = new BCDetailDAOHibernate();
		
		BCDetailBean bean = new BCDetailBean(); 
		
//insert
//		bean.setBCID("BC00000001");
//		bean.setISBN("9789869458023");
//		bean.setBookRank(1);
//		dao.insert(bean);		
	
//update
//		bean.setBCID("BC00000003");
//		bean.setISBN("9789869458023");
//		bean.setBookRank(0);
//		dao.update(bean);	
		
//delete
//		bean.setBCID("BC00000001");
//		bean.setISBN("9789869458023");
//		bean.setBookRank(1);
//		dao.delete("BC00000001");		
//		
		List<BCDetailBean>list = dao.getAll();
		for(BCDetailBean o:list){
			System.out.println(o.getBCID()+","+o.getISBN()+","+o.getBookRank());
		}
	}
	
	

	@Override
	public void insert(BCDetailBean bean) {
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
	public void update(BCDetailBean bean) {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction().commit();
			session.saveOrUpdate(bean);
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}		
	}

	@Override
	public void delete(String ISBN) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			BCDetailBean bean = (BCDetailBean)session.get(BCDetailBean.class,ISBN);
			session.delete(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().commit();
			throw e;
		}
		
	}

	@Override
	public BCDetailBean findByID(String ISBN) {
		try {
			BCDetailBean bean = session.get(BCDetailBean.class, ISBN);
			return bean;
		} catch (RuntimeException e) {			
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<BCDetailBean> getAll() {
		List<BCDetailBean>list = null;
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
