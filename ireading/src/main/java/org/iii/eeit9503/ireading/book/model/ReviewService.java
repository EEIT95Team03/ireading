package org.iii.eeit9503.ireading.book.model;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	public List<ReviewBean>getAll(){
		return reviewDAO.getAll();
	}
	
public List<ReviewBean> findByMemberID(String MemberID){	
	return reviewDAO.findByMemberID(MemberID);
	
}
	
	public List<ReviewBean> findByISBN(String ISBN){
		
		return reviewDAO.findByISBN(ISBN);
	}
	
	public int insert(ReviewBean reviewBean){
		return reviewDAO.insert(reviewBean);
	}
	
	public int update(ReviewBean reviewBean){
		return reviewDAO.update(reviewBean);	
		}
	
	public int delete(String ISBN,String MemberID){
		return reviewDAO.delete(ISBN, MemberID);
		
	}
	
	public ReviewBean findByMemberIDandISBN(String ISBN,String MemberID){
		return reviewDAO.findByMemberIDandISBN(ISBN, MemberID);
	}	
	

	public String getDateTime() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		//System.out.println(strDate);
		return strDate;
	}
	
	
}
