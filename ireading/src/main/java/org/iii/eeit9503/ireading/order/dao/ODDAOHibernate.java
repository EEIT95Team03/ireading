package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.iii.eeit9503.ireading.order.bean.ODBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ODDAOHibernate implements ODDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(ODBean odbean) {
		try {

			Session session = this.getSession();
		
			session.save(odbean);
				return 1;			
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int update(ODBean odbean) {
		try {

			Session session = this.getSession();
		
			session.saveOrUpdate(odbean);
			return 1;			
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int delete(String OrderID, String ProductID) {
		try {
		Session session = this.getSession();		
		Query query=session.createQuery("delete from ODBean where OrderID=:OrderID and ProductID=:ProductID");
		query.setParameter("OrderID", OrderID);
		query.setParameter("ProductID", ProductID);
		int delete=query.executeUpdate();
				
		return delete;
		} 
		catch (Exception e) {
			return 0;
		}
	}

	@Override
	public List<ODBean> findByOrderID(String OrderID) {
		try {
		Session session = this.getSession();	
		Query query=session.createQuery("from ODBean where OrderID=:OrderID");
		query.setParameter("OrderID", OrderID);
		List<ODBean> bean=query.list();		
		
		return bean;
		} 
		catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<ODBean> findByProductID(String ProductID) {
		try {
			Session session = this.getSession();	
			Query query=session.createQuery("from ODBean where ProductID=:ProductID");
			query.setParameter("ProductID", ProductID);
			List<ODBean> bean=query.list();		
			
			return bean;
			} 
			catch (Exception e) {
				return null;
			}
	}

	@Override
	public List<ODBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from ODBean");
			List<ODBean> list = query.list();

			return list;
		} catch (Exception e) {
			return null;
		} 
	}
	
	public int check(ODBean odbean) {
		Session session = this.getSession();
		
		Query query = session.createQuery("from ODBean where OrderID=:OrderID and ProductID=:ProductID");
		query.setParameter("OrderID", odbean.getOrderID());
		System.out.println(odbean.getOrderID());
		query.setParameter("ProductID", odbean.getProductID());
		System.out.println(odbean.getProductID());
		
		List<Object[]> list=query.list();
		if(list.size()!=0){return 1;}
		else{
		return 0;}
		
	}
}
