package org.iii.eeit9503.ireading.member.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.bean.PaymentBean;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOHibernate implements PaymentDAO{

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public int insert(PaymentBean paymentBean) {
		try {
			Session session = this.getSession();			
			session.save(paymentBean);			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int update(PaymentBean paymentBean) {
		try {
			Session session = this.getSession();
			session.saveOrUpdate(paymentBean);
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int delete(String ProductID) {
		try {
			Session session = this.getSession();
			
			Query query=session.createQuery("from PaymentBean where ProductID=:ProductID");
			query.setParameter("ProductID", ProductID);
			int update=query.executeUpdate();

			return update;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
	}

	@Override
	public PaymentBean findByProductID(String ProductID) {
		try {
			Session session = this.getSession();
			
			PaymentBean bean = session.get(PaymentBean.class,ProductID);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<PaymentBean> findByMemberID(String MemberID) {
		try {
			Session session = this.getSession();
			Query query= session.createQuery("from PaymentBean where MemberID=:MemberID order by Paytime DESC");
			query.setParameter("MemberID",MemberID);
			List<PaymentBean> list=query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<PaymentBean> findByMemberIDandMonth(String MemberID, String month) {
		try {
			Session session = this.getSession();
			Query query= session.createQuery("From PaymentBean WHERE MemberID =:MemberID and Paytime >= :Date order by Paytime DESC");
			query.setParameter("MemberID",MemberID);
			query.setParameter("Date",DateTansfer.getQueryTime(month));
			List<PaymentBean> list=query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	@Override
	public List<PaymentBean> getAll() {
		try {		
			Session session = this.getSession();
			Query query = session.createQuery("from PaymentBean");
			List<PaymentBean> list= query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}



}
