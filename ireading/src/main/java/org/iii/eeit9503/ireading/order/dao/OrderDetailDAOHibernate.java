package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDetailDAOHibernate implements OrderDetailDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(OrderDetailBean orderDetailbean) {
		try {

			Session session = this.getSession();
		
			session.save(orderDetailbean);
				return 1;			
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int update(OrderDetailBean orderDetailbean) {
		try {

			Session session = this.getSession();
		
			session.saveOrUpdate(orderDetailbean);
			return 1;			
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int delete(String OrderID, String ProductID) {
		try {
		Session session = this.getSession();		
		Query query=session.createQuery("delete from OrderDetailBean where OrderID=:OrderID and ProductID=:ProductID");
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
	public List<OrderDetailBean> findByOrderID(String OrderID) {
		try {
		Session session = this.getSession();	
		Query query=session.createQuery("from OrderDetailBean where OrderID=:OrderID");
		query.setParameter("OrderID", OrderID);
		List<OrderDetailBean> bean=query.list();		
		
		return bean;
		} 
		catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<OrderDetailBean> findByProductID(String ProductID) {
		try {
			Session session = this.getSession();	
			Query query=session.createQuery("from OrderDetailBean where ProductID=:ProductID");
			query.setParameter("ProductID", ProductID);
			List<OrderDetailBean> bean=query.list();		
			
			return bean;
			} 
			catch (Exception e) {
				return null;
			}
	}

	@Override
	public List<OrderDetailBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from OrderDetailBean");
			List<OrderDetailBean> list = query.list();

			return list;
		} catch (Exception e) {
			return null;
		} 
	}
	
	public int check(OrderDetailBean orderDetailbean) {
		Session session = this.getSession();
		
		Query query = session.createQuery("from OrderDetailBean where OrderID=:OrderID and ProductID=:ProductID");
		query.setParameter("OrderID", orderDetailbean.getOrderID());
		System.out.println(orderDetailbean.getOrderID());
		query.setParameter("ProductID", orderDetailbean.getProductID());
		System.out.println(orderDetailbean.getProductID());
		
		List<Object[]> list=query.list();
		if(list.size()!=0){return 1;}
		else{
		return 0;}
		
	}
}
