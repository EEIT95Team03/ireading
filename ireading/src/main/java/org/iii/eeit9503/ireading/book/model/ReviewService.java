package org.iii.eeit9503.ireading.book.model;

import java.util.List;

import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.iii.eeit9503.ireading.book.dao.ReviewDAO;
import org.iii.eeit9503.ireading.book.dao.ReviewDAOHibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	public int insert(ReviewBean bean){
		return reviewDAO.insert(bean);
	}
	
	public int update(ReviewBean bean){
		return reviewDAO.update(bean);
	}
	
	
	public int delete(String MemberID, String ISBN){
		return reviewDAO.delete(MemberID, ISBN);
	}
	
	public List<ReviewBean> findByMemberID(String MemberID){
		return reviewDAO.findByMemberID(MemberID);
	}
	
	public List<ReviewBean> findByISBN(String ISBN){
		return reviewDAO.findByISBN(ISBN);
	}
	
	public ReviewBean findByMemberIDandISBN(String MemberID, String ISBN){
		return reviewDAO.findByMemberIDandISBN(MemberID, ISBN);
	}
	
	public List<ReviewBean> getAll(){
		return reviewDAO.getAll();
	}
	
	
	
}
