package org.iii.eeit9503.ireading.book.dao;

import java.util.List;

import org.iii.eeit9503.ireading.book.bean.ReviewBean;


public interface ReviewDAO {
	public int insert(ReviewBean bean);
	public int update(ReviewBean bean);
	public int delete(String MemberID, String ISBN);
	public List<ReviewBean> findByMemberID(String MemberID);
	public List<ReviewBean> findByISBN(String ISBN);
	public ReviewBean findByMemberIDandISBN(String MemberID, String ISBN);
	public List<ReviewBean> getAll();
	

}
