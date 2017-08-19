package org.iii.eeit9503.ireading.book.dao;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOHibernate implements ReviewDAO {
	
	@Autowired
	private SessionFactory sessioFactory;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public Session getSession(){
		return sessioFactory.getCurrentSession();
	}	
//	private Session session;

	@Override
	public List<ReviewBean> getAll() {
		Session session = this.getSession();
		
		Query query = session.createQuery("from ReviewBean");
		List<ReviewBean> list = query.list();
		return list;
	}

	@Override
	public List<ReviewBean> findByMemberID(String MemberID) {
		// TODO Auto-generated method stub
		try{
			Session session = this.getSession();
			
			Query query=session.createQuery("from ReviewBean where MemberID=:MemberID");
			query.setParameter("MemberID", MemberID);
			
			
			return query.list();						
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}		
	}

	@Override
	public List<ReviewBean> findByISBN(String ISBN) {
		// TODO Auto-generated method stub
		try{
			Session session = this.getSession();
			
			Query query=session.createQuery("from ReviewBean where ISBN=:ISBN");
			query.setParameter("ISBN", ISBN);
					
			return query.list();						
		}catch(Exception e){
			e.printStackTrace();
			return null;}
	}

	
	@Override
	public int insert(ReviewBean reviewBean) {
		try{
			Session session = this.getSession();
			
			session.save(reviewBean);
			
			return 1;								
		}catch(Exception e){
			e.printStackTrace();
			return 0;}
	}

	@Override
	public int update(ReviewBean reviewBean) {
		try{
			Session session = this.getSession();
			
			session.update(reviewBean);
			
			return 1;								
		}catch(Exception e){
			e.printStackTrace();
			return 0;}
	}

	@Override
	public int delete(String ISBN, String MemberID) {
		try{
			Session session = this.getSession();
			
			Query query=session.createQuery("delete from ReviewBean where ISBN=:ISBN and  MemberID=:MemberID");
			query.setParameter("ISBN", ISBN);
			query.setParameter("MemberID", MemberID);
			
			
			return query.executeUpdate();								
		}catch(Exception e){
			e.printStackTrace();
			return 0;}
	}

	@Override
	public ReviewBean findByMemberIDandISBN(String ISBN, String MemberID) {
		try{
			Session session = this.getSession();
			
			Query query=session.createQuery("from ReviewBean where ISBN=:ISBN and  MemberID=:MemberID");
			query.setParameter("ISBN", ISBN);
			query.setParameter("MemberID", MemberID);
			List<ReviewBean> list=query.list();	
			for(ReviewBean bean:list){
				
				return bean;
			}		
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;}
	}

	@Override
	public List<Map<String, Object>> getMemberReview(String MemberID) {
		String sql="Select * from Review where MemberID='"+MemberID+"' ";
		
		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sql);
		
		return dataLs;
	}
	
	

}
