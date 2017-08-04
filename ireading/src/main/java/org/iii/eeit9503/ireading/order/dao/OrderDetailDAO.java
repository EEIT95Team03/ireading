package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;

public interface OrderDetailDAO {
	public int insert(OrderDetailBean orderDetailbean);
	public int update(OrderDetailBean orderDetailbean);
	public int delete(String OrderID,String ProductID);
	public List<OrderDetailBean> findByID(String OrderID,String ProductID);
	public List<OrderDetailBean> findByOrderID(String OrderID);
	public List<OrderDetailBean> findByProductID(String ProductID);
	public List<OrderDetailBean> getAll();	
	public int check(OrderDetailBean orderDetailbean);
}
