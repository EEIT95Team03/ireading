package org.iii.eeit9503.ireading.order.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.criteria.Order;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOHibernate implements OrderDAO{
	@Autowired
	private SessionFactory sessionFactory = null;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(OrderBean orderbean) {
		// TODO Auto-generated method stub
		try {
			
			Session session = this.getSession();
			
			 OrderBean bean=session.get(OrderBean.class, orderbean.getOrderID());
			
			if(bean==null){
			session.saveOrUpdate(orderbean);

			return 1;}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int update(OrderBean orderbean) {
		// TODO Auto-generated method stub
		try {
			Session session = this.getSession();

			session.saveOrUpdate(orderbean);

			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}

	@Override
	public int delete(String OrderID) {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("delete from OrderBean where OrderID=?");
			query.setParameter(0, OrderID);
			int delete = query.executeUpdate();

			return delete;
		} catch (Exception e) {
			// TODO: handle exception

			return 0;
		}
	}

	@Override
	public OrderBean findByID(String OrderID) {
		try {
			Session session = this.getSession();

			OrderBean bean = session.get(OrderBean.class, OrderID);

			return bean;
		} catch (Exception e) {

			return null;
		}

	}

	@Override
	public List<OrderBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from OrderBean");
			List<OrderBean> list = query.list();

			return list;
		} catch (Exception e) {
			return null;
		} 
	}

	

}
