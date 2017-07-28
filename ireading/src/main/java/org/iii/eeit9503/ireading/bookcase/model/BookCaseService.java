package org.iii.eeit9503.ireading.bookcase.model;

import java.util.List;

import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.bookcase.dao.BookCaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookCaseService {
		
	@Autowired
	private BookCaseDAO bookCaseDAO;
	
	public int insert(BookCaseBean bean){
		return bookCaseDAO.insert(bean);
	}
		
	public int update(BookCaseBean bean){
		return bookCaseDAO.update(bean);
	}
	
	public int delete(String BCID){
		return bookCaseDAO.delete(BCID);
	}
	
	public BookCaseBean findByID(String BCID){
		return bookCaseDAO.findByID(BCID);
	}
	
	public List<BookCaseBean>getAll(){
		return bookCaseDAO.getAll();
	}
}
