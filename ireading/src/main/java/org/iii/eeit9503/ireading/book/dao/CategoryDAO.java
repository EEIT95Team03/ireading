package org.iii.eeit9503.ireading.book.dao;

import java.util.List;

import org.iii.eeit9503.ireading.book.bean.CategoryBean;

public interface CategoryDAO {
	public int insert(CategoryBean categoryBean);

	public int update(CategoryBean categoryBean);

	public int delete(String CategoryID);

	public CategoryBean findByID(String CategoryID);

	public List<CategoryBean> getAll();

} 
