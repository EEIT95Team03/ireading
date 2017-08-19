package org.iii.eeit9503.ireading.book.dao;

import java.util.List;
import java.util.Map;

import org.iii.eeit9503.ireading.book.bean.ReviewBean;


public interface ReviewDAO {
	
	public List<ReviewBean> getAll();
	
	public List<ReviewBean> findByMemberID(String MemberID);
	
	public List<Map<String,Object>> getMemberReview(String MemberID);
	
	public List<ReviewBean> findByISBN(String ISBN);
	
	public int insert(ReviewBean reviewBean);
	
	public int update(ReviewBean reviewBean);
	
	public int delete(String ISBN,String MemberID);
	
	public ReviewBean findByMemberIDandISBN(String ISBN,String MemberID);
	
	

}
