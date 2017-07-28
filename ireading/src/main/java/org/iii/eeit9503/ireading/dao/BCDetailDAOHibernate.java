package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.BCDetailBean;


public class BCDetailDAOHibernate implements BCDetailDAO {
	
	public static final String GET_ALL_STMT="from BCDetailBean order by BCID";
	private Session session;
	
	public static void main(String[] args){
		BCDetailDAOHibernate dao = new BCDetailDAOHibernate();
		
		BCDetailBean bean = new BCDetailBean(); 
		
//insert
//		bean.setISBN("9789869458023");
//		bean.setBCID("BC00000004");		
//		bean.setBookRank(1);
//		dao.insert(bean);		
	
//update
//		bean.setISBN("9789869458023");
//		bean.setBCID("BC00000004");
//		bean.setBookRank(0);
//		dao.update(bean);	
		
//delete
//		bean.setISBN("9789869458023");
//		bean.setBCID("BC00000004");
//		bean.setBookRank(1);
//		dao.delete("9789869458023", "BC00000004");		
//		
		List<BCDetailBean>list = dao.getAll();
		for(BCDetailBean o:list){
			System.out.println(o.getBCID()+","+o.getISBN()+","+o.getBookRank());
		}
	}
	
	

	@Override
	public void insert(BCDetailBean bean) {
		session = HibernateUtil.getSessionFactory().getCurrentSession();
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
		session = HibernateUtil.getSessionFactory().getCurrentSession();
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
	public void delete(String ISBN, String BCID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();			
			BCDetailBean bean = new BCDetailBean();
			bean.setISBN(ISBN);
			bean.setBCID(BCID);
			session.delete(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		
	}

	@Override
	public BCDetailBean findByID(String ISBN, String BCID) {
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			BCDetailBean bean = new BCDetailBean();
			Criteria query = session.createCriteria(BCDetailBean.class);
			query.add(Restrictions.eq("ISBN",ISBN));
			query.add(Restrictions.eq("BCID",BCID));
			bean = (BCDetailBean)query.uniqueResult();
			return bean;			
		} catch (RuntimeException e) {			
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<BCDetailBean> getAll() {
		List<BCDetailBean>list = null;
		session = HibernateUtil.getSessionFactory().getCurrentSession();
		
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
