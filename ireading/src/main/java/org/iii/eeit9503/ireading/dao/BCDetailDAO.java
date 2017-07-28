package org.iii.eeit9503.ireading.dao;

import java.util.List;
import org.iii.eeit9503.ireading.model.BCDetailBean;

public interface BCDetailDAO {
	public void insert(BCDetailBean bean);
	public void update(BCDetailBean bean);
	public void delete(String ISBN, String BCID);	
	public BCDetailBean findByID(String ISBN, String BCID);
	public List<BCDetailBean>getAll();
	
	
	

}
