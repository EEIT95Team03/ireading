package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.order.bean.PayBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAOHibernate implements PayDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(PayBean paybean) {
		try {

			Session session = this.getSession();

			PayBean bean = session.get(PayBean.class, paybean.getPayID());

			if (bean == null) {
				session.saveOrUpdate(paybean);

				return 1;
			}
			return 0;
		} catch (Exception e) {
			return 0;
		}

	}

	@Override
	public int update(PayBean paybean) {
		try {
			Session session = this.getSession();

			session.saveOrUpdate(paybean);

			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}

	@Override
	public int delete(String payID) {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("delete from PayBean where PayID=?");
			query.setParameter(0, payID);
			int delete = query.executeUpdate();

			return delete;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public PayBean findByID(String payID) {
		try {
			Session session = this.getSession();

			PayBean bean = session.get(PayBean.class, payID);

			return bean;
		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<PayBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from PayBean");
			List<PayBean> list = query.list();

			return list;
		} catch (Exception e) {
			return null;
		} 
	}

}
