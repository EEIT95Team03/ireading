package org.iii.eeit9503.ireading.bookcase.dao;

import java.util.List;
import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;

public interface BCDetailDAO {
	public int insert(BCDetailBean bean);
	public int update(BCDetailBean bean);
	public int delete(String ISBN, String BCID);	
	public List<BCDetailBean> findByBCID(String BCID);
	public List<BCDetailBean>getAll();
	
	
	

}
