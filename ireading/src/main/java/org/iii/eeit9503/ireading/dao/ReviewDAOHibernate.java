package org.iii.eeit9503.ireading.dao;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.ReviewBean;

public class ReviewDAOHibernate implements ReviewDAO {
	
	private static final String GET_ALL_STMT="from ReviewBean order by MemberID";
	private Session session;

	public static void main(String[] args) {
		ReviewDAOHibernate dao = new ReviewDAOHibernate();
		
		ReviewBean bean = new ReviewBean();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
//insert
		bean.setMemberID("M170000011");
		bean.setISBN("9789861754604");
		bean.setRate(3);
		bean.setCont("GOOOOOOOOOOOOOOOOOOOOOOOOOD!");		
		try {
			bean.setPostTime(new Timestamp(sdf.parse("1999-11-11 01:22:33").getTime()));
			//sdf.parse得到日期 .getTime換成秒數
		} catch (ParseException e) {			
			e.printStackTrace();
		}
		dao.insert(bean);
		
		
//update
//		bean.setMemberID("M170000007");
//		bean.setCont("AAAA");
//		dao.update(bean);
		
//delete
//		bean.setMemberID("M170000011");
//		bean.setISBN("9789861754604");
//		bean.setRate(3);
//		bean.setCont("GOOOOOOOOOOOOOOOOOOOOOOOOOD!");		
//		try {
//			bean.setPostTime(new Timestamp(sdf.parse("1999-11-11 01:22:33").getTime()));
//			//sdf.parse得到日期 .getTime換成秒數
//		} catch (ParseException e) {			
//			e.printStackTrace();
//		}		
//		dao.delete("M170000011");
		
		List<ReviewBean>list = dao.getAll();
		for(ReviewBean o:list){
			System.out.println(o.getMemberID()+", "+o.getISBN()+", "+o.getCont()+", "+o.getRate()+", "+o.getPostTime());
		}	

	}	
	
	
	
	@Override
	public void insert(ReviewBean bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}			
	}
	
	@Override
	public void update(ReviewBean bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();			
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
	}
	
	@Override
	public void delete(String MemberID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ReviewBean bean = (ReviewBean)session.get(ReviewBean.class, MemberID);			
			session.delete(bean);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}			
	}
	
	@Override
	public ReviewBean findByID(String MemberID) {
		try {
			ReviewBean bean = session.get(ReviewBean.class, MemberID);
			return bean;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		}	
	}
	
	@Override
	public List<ReviewBean> getAll() {
		List<ReviewBean>list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
			return list;	
		}catch (RuntimeException e){
			session.getTransaction().rollback();
			e.printStackTrace();
			return list;
		}		
	}
}
