package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOHibernate implements OrderDAO{
	@Autowired
	private SessionFactory sessionFactory;

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

			session.update(orderbean);

			return 1;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
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
	@Override
	public String getLastID(){
		try {
			Session session = this.getSession();
			Query query = session.createSQLQuery("select Top 1 OrderID from Orders order by OrderID desc");
			List<Object> list = query.list();
			String ID=null;
			for(Object Array:list){
				ID=(String) Array;}
			System.out.println(ID);
			return ID;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		
	}

	
	@Override
	public List<OrderBean> getAllbyMemberID(String MemberID) {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from OrderBean where MemberID=:MemberID");
			query.setParameter("MemberID",MemberID);
			List<OrderBean> list = query.list();

			return list;
		} catch (Exception e) {
			return null;
		} 
	}

}
