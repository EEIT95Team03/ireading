package org.iii.eeit9503.ireading.book.dao;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOHibernate implements ReviewDAO {
	
	@Autowired
	private SessionFactory sessioFactory;
	
	public Session getSession(){
		return sessioFactory.getCurrentSession();
	}	
//	private Session session;
	
	private static final String GET_ALL_STMT="from ReviewBean order by MemberID";
	
	
	
	@Override
	public int insert(ReviewBean bean) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session = this.getSession();
		try {
			
			session.saveOrUpdate(bean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}			
	}
	
	@Override
	public int update(ReviewBean bean) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session = this.getSession();
		try {
			session.saveOrUpdate(bean);
			return 1;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}	
	}
	
	@Override
	public int delete(String MemberID, String ISBN) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session = this.getSession();
		try {
			ReviewBean bean = new ReviewBean();
			bean.setISBN(ISBN);
			bean.setMemberID(MemberID);	
			session.delete(bean);
			return 1;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}			
	}
	public List<ReviewBean> findByMemberID(String MemberID){
		try {
		Session session = this.getSession();
		Query query = session.createQuery("from ReviewBean where MemberID=:MemberID");
		query.setParameter("MemberID",MemberID);
		List<ReviewBean> list=query.list();

		return list;
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
		
	}
	public  List<ReviewBean> findByISBN(String ISBN){
		try {ReviewBean bean1=new ReviewBean();
		Session session = this.getSession();
		Query query = session.createQuery("from ReviewBean where ISBN=:ISBN");
		query.setParameter("ISBN",ISBN);
		List<ReviewBean> list=query.list();

		return list;
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}	
		
	}
	@Override
	public ReviewBean findByMemberIDandISBN(String MemberID, String ISBN) {
		try {ReviewBean bean1=new ReviewBean();
			Session session = this.getSession();
			Query query = session.createQuery("from ReviewBean where MemberID=:MemberID and ISBN=:ISBN");
			query.setParameter("MemberID",MemberID);
			query.setParameter("ISBN",ISBN);
			List<ReviewBean> list=query.list();
			for(ReviewBean bean2:list)
			{
				bean1=bean2;
			}
			return bean1;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}	
	}
	
	@Override
	public List<ReviewBean> getAll() {	
		try{
			Session session = this.getSession();
			Query query = session.createQuery(GET_ALL_STMT);
			List<ReviewBean>list = query.list();
			return list;	
		}catch (RuntimeException e){
			e.printStackTrace();
			return null;
		}		
	}
}
