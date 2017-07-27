package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.bean.OrderStatusBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderStatusDAOHibernate implements OrderStatusDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(OrderStatusBean orderStatusBean) {
		try {
			Session session = this.getSession();

			OrderStatusBean bean = session.get(OrderStatusBean.class, orderStatusBean.getStatusID());

			if (bean == null) {
				session.saveOrUpdate(orderStatusBean);

				return 1;
			}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int update(OrderStatusBean orderStatusBean) {
		try {
			Session session = this.getSession();

			session.saveOrUpdate(orderStatusBean);

			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}

	@Override
	public int delete(String statusID) {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("delete from OrderStatusBean where StatusID=?");
			query.setParameter(0, statusID);
			int delete = query.executeUpdate();

			return delete;
		} catch (Exception e) {
			// TODO: handle exception

			return 0;
		}
	}

	@Override
	public OrderStatusBean findByID(String statusID) {
		try {
			Session session = this.getSession();

			OrderStatusBean bean = session.get(OrderStatusBean.class, statusID);

			return bean;
		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<OrderStatusBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from OrderStatusBean");
			List<OrderStatusBean> list = query.list();

			return list;
		} catch (Exception e) {
			return null;
		} 
	}

}
