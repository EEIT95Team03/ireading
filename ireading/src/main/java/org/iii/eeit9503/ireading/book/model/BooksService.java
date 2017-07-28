package org.iii.eeit9503.ireading.book.model;

import java.util.List;

import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.dao.BooksDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooksService {
	@Autowired
	private BooksDAO booksDAO;
	
	public int insert(BooksBean booksBean){
		 
		return booksDAO.insert(booksBean);
	}
	
	public int update(BooksBean booksBean){
		return booksDAO.update(booksBean);
	}
	
	public int delete(String ISBN){
		return booksDAO.delete(ISBN);
	}
	
	public BooksBean findByID(String ISBN){
		return booksDAO.findByID(ISBN);
	}
	
	public List<BooksBean> getAll(){
		return booksDAO.getAll();
	}
	

}
