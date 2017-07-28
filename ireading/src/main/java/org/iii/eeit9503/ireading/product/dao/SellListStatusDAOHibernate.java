package org.iii.eeit9503.ireading.product.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.product.bean.SellListStatusBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellListStatusDAOHibernate implements SellListStatusDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public int insert(SellListStatusBean sellListStatusBean) {
		try {
			Session session = this.getSession();
			
			session.saveOrUpdate(sellListStatusBean);
			
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		} 
	}

	@Override
	public int update(SellListStatusBean sellListStatusBean) {
		try {			
			Session session = this.getSession();
			session.saveOrUpdate(sellListStatusBean);
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		} 
	}

	@Override
	public int delete(String StatusID) {
		try {
			Session session = this.getSession();
	        Query query = session.createQuery("delete from SellListStatusBean where StatusID=:StatusID");
			query.setParameter("StatusID", StatusID);
			int delete = query.executeUpdate();
			
			return delete;
			} catch (Exception e) {
			return 0;
			} 
	}

	@Override
	public SellListStatusBean findByPrimaryKey(String StatusID) {
		try {
			Session session = this.getSession();
			
			SellListStatusBean bean =session.get(SellListStatusBean.class,StatusID);
				
			return bean;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		} 
	}

	@Override
	public List<SellListStatusBean> getAll() {
		try {
			Session session = this.getSession();
			
			Query query = session.createQuery("FROM SellListStatusBean");
			List<SellListStatusBean> list = query.list();
			
			return list;
		} catch (Exception e) {
			return null;
		}
	}

}
