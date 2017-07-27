package org.iii.eeit9503.ireading.order.model;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.OrderStatusBean;
import org.iii.eeit9503.ireading.order.dao.OrderDAO;
import org.iii.eeit9503.ireading.order.dao.OrderStatusDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderStatusService {

	@Autowired
	private OrderStatusDAO orderStatusDAO;
	
	
	public int insert(OrderStatusBean orderStatusBean){
		return orderStatusDAO.insert(orderStatusBean);
	}
	
	public int update(OrderStatusBean orderStatusBean){
		
		return orderStatusDAO.update(orderStatusBean);
	}
	
	public int delete(String statusID){
		return orderStatusDAO.delete(statusID);
	}
	
	public OrderStatusBean findByID(String statusID){
		return orderStatusDAO.findByID(statusID);
	}
	
	public List<OrderStatusBean> getAll(){
		return orderStatusDAO.getAll();
		
	}
}
