package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.OrderStatusBean;

public interface OrderStatusDAO {

	public int insert(OrderStatusBean orderStatusBean);
	public int update(OrderStatusBean orderStatusBean);
	public int delete(String statusID);
	public OrderStatusBean findByID(String statusID);
	public List<OrderStatusBean> getAll();
	
}
