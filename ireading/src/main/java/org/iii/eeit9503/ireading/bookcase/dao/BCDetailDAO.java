package org.iii.eeit9503.ireading.bookcase.dao;

import java.util.List;

import javax.persistence.Id;

import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;

public interface BCDetailDAO {

	public abstract BCDetailBean select(String ISBN, String BCID);
	
	public abstract List<BCDetailBean>select();
	
	public abstract BCDetailBean insert(BCDetailBean bCDetailBean);
		
	public int delete(String ISBN,String BCID);
	
	public List<BCDetailBean> findbyBCID(String BCID);
	
}
