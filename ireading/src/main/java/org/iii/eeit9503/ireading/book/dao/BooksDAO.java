package org.iii.eeit9503.ireading.book.dao;

import java.util.List;

import org.iii.eeit9503.ireading.book.bean.BooksBean;

public interface BooksDAO {
	
	public  BooksBean select(String ISBN);
	
	public  BooksBean findByID(String ISBN);
	
	public  List<BooksBean> select();
	
	public  int insert(BooksBean booksBean);

	public  BooksBean update(BooksBean bean);

	public  int delete(String ISBN);

} 
