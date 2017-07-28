package org.iii.eeit9503.ireading.book.dao;

import java.util.List;

import org.iii.eeit9503.ireading.book.bean.BooksBean;

public interface BooksDAO {
	public int insert(BooksBean booksBean);

	public int update(BooksBean booksBean);

	public int delete(String ISBN);

	public BooksBean findByID(String ISBN);

	public List<BooksBean> getAll();

} 