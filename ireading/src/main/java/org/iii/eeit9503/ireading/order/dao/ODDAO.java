package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.ODBean;

public interface ODDAO {
	public int insert(ODBean odbean);
	public int update(ODBean odbean);
	public int delete(String OrderID,String ProductID);
	public List<ODBean> findByOrderID(String OrderID);
	public List<ODBean> findByProductID(String ProductID);
	public List<ODBean> getAll();	
	public int check(ODBean odbean);
}
