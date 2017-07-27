package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.MemberBean;

public class MemberDAOHibernate implements MmeberDAO{
	
	private static final String GET_ALL_STMT = "from MemberBean order by MemberID";
	private Session session;
	
	public static void main(String[] args){
		MemberDAOHibernate dao= new MemberDAOHibernate();
		
		MemberBean bean = new MemberBean();
//		bean.setMemberID("M170000021");
//		bean.setMName("Anita");
//		bean.setAccount("aloha@gmail.com");
//		bean.setPwd("0000");
//		bean.setGender(1);
//		dao.insert(bean);
//		
//		
//		bean.setMemberID("M170000018");
//		bean.setMName("陳孝萱");
//		dao.update(bean);

		
//		bean.setMemberID("M170000022");
//		bean.setMName("Byer");
//		bean.setAccount("oolalala@gmail.com");
//		bean.setPwd("0055");
//		bean.setGender(0);
//		dao.insert(bean);
		
		dao.delete("M170000022");
		
		List<MemberBean> list = dao.getAll();
		for(MemberBean o:list){
			System.out.println(o.getMemberID() + "\t" + o.getMName() + "\t"
					+ o.getAccount() + "\t" + o.getPwd() + "\t" + o.getGender());
		}
		
	}

	@Override
	public void insert(MemberBean bean) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void update(MemberBean bean) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String MemberID) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			MemberBean bean = (MemberBean)session.get(MemberBean.class, MemberID);
			session.delete(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	@Override
	public MemberBean findByID(String MemberID) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			MemberBean bean = session.get(MemberBean.class, MemberID);
			return bean;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<MemberBean> getAll() {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<MemberBean> list = null;
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list= query.list();
			session.getTransaction().commit();
			return list;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		}

	}
	
	
	
	

}
