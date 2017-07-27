package org.iii.eeit9503.ireading.dao;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.OutputBean;
import org.springframework.beans.factory.annotation.Autowired;

public class OutputDAOHibernate implements OutputDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	private static final String GET_ALL_STMT = "from OutputBean order by MemberID";

	@Override
	public void insert(OutputBean bean) {
		Session session = this.getSession();
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
		}
	}

	@Override
	public void update(OutputBean bean) {
		Session session = this.getSession();
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
		}
	}

	@Override
	public void delete(String MemberID, String ApplyTime) {
		Session session = this.getSession();
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp date =  new Timestamp(df.parse(ApplyTime).getTime());
			OutputBean bean = new OutputBean();
			bean.setMemberID(MemberID);
			bean.setApplyTime(date);
			session.delete(bean);
			session.getTransaction().commit();
		} catch (RuntimeException | ParseException e) {
			session.getTransaction().rollback();
		}

	}

	@Override
	public OutputBean findByID(String MemberID, String ApplyTime) {
		Session session = this.getSession();
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			OutputBean bean = new OutputBean();
			Criteria query = session.createCriteria(OutputBean.class);
			query.add(Restrictions.eq("MemberID", MemberID));
			query.add(Restrictions.eq("ApplyTime", ApplyTime));
			bean = (OutputBean) query.uniqueResult();
			return bean;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OutputBean> getAll() {
		Session session = this.getSession();
		List<OutputBean> list = null;
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
			return list;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}
	}

	//測試方法
	public static void main(String[] args) {
		OutputDAOHibernate dao = new OutputDAOHibernate();
		OutputBean bean = new OutputBean();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp date;
//		bean.setMemberID("M170000022");
//		try {
//			date = new Timestamp(df.parse("2017-06-18 15:22:00").getTime());
//			bean.setApplyTime(date);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		bean.setBankAccount("8044679970881");
//		bean.setAmount(480);
//		bean.setTotalTransfer(400);
//		dao.insert(bean);

//		bean.setMemberID("M170000018");
//		try {
//			date = new Timestamp(df.parse("2017-06-18 12:30:00").getTime());
//			bean.setApplyTime(date);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		bean.setBankAccount("99999999999");
//		bean.setTotalTransfer(480);
//		dao.update(bean);
	

//		dao.delete("M170000022", "2017-06-18 10:10:00");

		List<OutputBean> list = dao.getAll();
		for (OutputBean o : list) {
			System.out.println(o.getMemberID() + "\t" + o.getApplyTime() + "\t" + o.getBankAccount() + "\t"
					+ o.getAmount() + "\t" + o.getTotalTransfer());
		}

	}
}
