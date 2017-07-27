package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.iii.eeit9503.ireading.model.BookCaseBean;

public interface BookCaseDAO {
	public void insert(BookCaseBean bean);
	public void update(BookCaseBean bean);
	public void delete(String BCID);
	public BookCaseBean findByID(String BCID);
	public List<BookCaseBean>getAll();	
}
