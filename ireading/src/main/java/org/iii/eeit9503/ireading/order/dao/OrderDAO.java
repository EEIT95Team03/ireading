package org.iii.eeit9503.ireading.order.dao;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.OrderBean;

public interface OrderDAO{

public int insert(OrderBean orderbean);
public int update(OrderBean orderbean);
public int delete(String OrderID);
public OrderBean findByID(String OrderID);
public List<OrderBean> getAll();

	
}
