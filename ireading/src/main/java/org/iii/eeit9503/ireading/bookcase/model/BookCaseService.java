package org.iii.eeit9503.ireading.bookcase.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.bookcase.dao.BookCaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookCaseService {
	
	@Autowired	
	private BookCaseDAO bookCaseDAO;

	public List<BookCaseBean> select(BookCaseBean bean){
		List<BookCaseBean> result = null;
		if(bean!=null && bean.getBCID()!="") {
			BookCaseBean temp = bookCaseDAO.select(bean.getBCID());
			if(temp!=null) {
				result = new ArrayList<BookCaseBean>();
				result.add(temp);
			}
		} else {
			result = bookCaseDAO.select(); 
		}
		return result;
	}
		
	public boolean insert(BookCaseBean bookCaseBean){		 
		try {
			bookCaseDAO.insert(bookCaseBean);			
		} catch(Exception e) {
			return false;
		}
		return true;
	}
	
		
	public BookCaseBean update(BookCaseBean bookCaseBean){
		BookCaseBean result = null;
		if(bookCaseBean!=null) {
			result = bookCaseDAO.update(bookCaseBean);
		}
		return result;
	}
	
	public int delete(String BCID){
		int result = 0;
		if(BCID!=null) {
			result = bookCaseDAO.delete(BCID);
		}
		return result;
	}			
	
	public List<BookCaseBean> selectMemberID(String MemberID){		
		return bookCaseDAO.selectMemberID(MemberID);
	}
	
	public String getlastID() {
		
		return bookCaseDAO.getlastID();
	}

	public BookCaseBean findByBCID(String BCID) {
		
		return bookCaseDAO.findByBCID(BCID);
	}



}

