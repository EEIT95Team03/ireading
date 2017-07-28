package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.model.JoinListBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinListDAOHibernate implements JoinListDAO{
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(JoinListBean joinlistbean) {
		try {

			Session session = this.getSession();
		
			session.save(joinlistbean);
				return 1;			
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int update(JoinListBean joinlistbean) {
		try {

			Session session = this.getSession();
		
			session.saveOrUpdate(joinlistbean);
			return 1;			
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int delete(String EventID, String MemberID) {
		try {
		Session session = this.getSession();		
		Query query=session.createQuery("delete from JoinListBean where EventID=:EventID and MemberID=:MemberID");
		query.setParameter("EventID", EventID);
		query.setParameter("MemberID", MemberID);
		int delete=query.executeUpdate();
				
		return delete;
		} 
		catch (Exception e) {
			return 0;
		}
	}

	@Override
	public List<JoinListBean> findByEventID(String EventID) {
		try {
		Session session = this.getSession();	
		Query query=session.createQuery("from JoinListBean where EventID=:EventID");
		query.setParameter("EventID", EventID);
		List<JoinListBean> bean=query.list();		
		
		return bean;
		} 
		catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<JoinListBean> findByMemberID(String MemberID) {
		try {
			Session session = this.getSession();	
			Query query=session.createQuery("from JoinListBean where MemberID=:MemberID");
			query.setParameter("MemberID", MemberID);
			List<JoinListBean> bean=query.list();		
			
			return bean;
			} 
			catch (Exception e) {
				return null;
			}
	}

	@Override
	public List<JoinListBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from JoinListBean");
			List<JoinListBean> list = query.list();

			return list;
		} catch (Exception e) {
			return null;
		} 
	}
	
	public int check(JoinListBean joinlistbean) {
		Session session = this.getSession();
		
		Query query = session.createQuery("from JoinListBean where EventID=:EventID and MemberID=:MemberID");
		query.setParameter("EventID", joinlistbean.getEventID());
		System.out.println(joinlistbean.getEventID());
		query.setParameter("MemberID", joinlistbean.getMemberID());
		System.out.println(joinlistbean.getMemberID());
		List<Object[]> list=query.list();
		if(list.size()!=0){return 1;}
		else{
		return 0;}
		
	}

}
