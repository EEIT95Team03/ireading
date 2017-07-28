package org.iii.eeit9503.ireading.bookcase.dao;

import java.util.List;

import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;



public interface BookCaseDAO {
	public int insert(BookCaseBean bean);
	public int update(BookCaseBean bean);
	public int delete(String BCID);
	public BookCaseBean findByID(String BCID);
	public List<BookCaseBean> getAll();	
}
