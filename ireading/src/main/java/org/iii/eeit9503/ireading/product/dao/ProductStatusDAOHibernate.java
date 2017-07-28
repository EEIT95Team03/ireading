package org.iii.eeit9503.ireading.product.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.product.bean.ProductStatusBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ProductStatusDAOHibernate implements ProductStatusDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public int insert(ProductStatusBean productStatusBean) {
		try {
			Session session = this.getSession();
			
			session.saveOrUpdate(productStatusBean);
			
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		} 
	}

	@Override
	public int update(ProductStatusBean productStatusBean) {
		try {			
			Session session = this.getSession();
			session.saveOrUpdate(productStatusBean);
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
	        Query query = session.createQuery("delete from ProductStatusBean where StatusID=:StatusID");
			query.setParameter("StatusID", StatusID);
			int delete = query.executeUpdate();
			
			return delete;
			} catch (Exception e) {
			return 0;
			} 
	}

	@Override
	public ProductStatusBean findByPrimaryKey(String StatusID) {
		try {
			Session session = this.getSession();
			
			ProductStatusBean bean =session.get(ProductStatusBean.class,StatusID);
				
			return bean;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		} 
	}

	@Override
	public List<ProductStatusBean> getAll() {
		try {
			Session session = this.getSession();
			
			Query query = session.createQuery("FROM ProductStatusBean");
			List<ProductStatusBean> list = query.list();
			
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	

}
