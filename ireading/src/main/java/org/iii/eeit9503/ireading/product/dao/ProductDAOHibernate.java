package org.iii.eeit9503.ireading.product.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductDAOHibernate implements ProductDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public int insert(ProductBean productbean) {
		// TODO Auto-generated method stub
		try {
			Session session = this.getSession();
			
			session.saveOrUpdate(productbean);
			
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		} 
	}
	
	@Override
	public int update(ProductBean productbean){
		// TODO Auto-generated method stub
		try {			
			Session session = this.getSession();
			session.saveOrUpdate(productbean);
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		} 
	}

	@Override
	public int delete(String ProductID) {
		try {
		Session session = this.getSession();
        Query query = session.createQuery("delete from ProductBean where ProductID=:ProductID");
		query.setParameter("ProductID", ProductID);
		int delete = query.executeUpdate();
		
		return delete;
		} catch (Exception e) {
		return 0;
		} 
	}
    
	@Override
	public ProductBean findByPrimaryKey(String ProductID) {
		try {
			Session session = this.getSession();
			
			ProductBean bean =session.get(ProductBean.class,ProductID);
		
			
			return bean;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		} 
	}

	@Override
	public List<ProductBean> getAll() {		
		List<ProductBean> list = null;
		try {
			Session session = this.getSession();
			
			Query query = session.createQuery("FROM ProductBean");
			list = query.list();
			
			return list;
		} catch (Exception e) {
			return null;
		}
	}

}
