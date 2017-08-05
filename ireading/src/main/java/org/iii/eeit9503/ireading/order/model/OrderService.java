package org.iii.eeit9503.ireading.order.model;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.dao.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    
	@Autowired
	private OrderDAO orderDAO;
	
	public int insert(OrderBean orderbean){
		 
		return orderDAO.insert(orderbean);
	}
	
	public int update(OrderBean orderbean){
		return orderDAO.update(orderbean);
	}
	
	public int delete(String OrderID){
		return orderDAO.delete(OrderID);
	}
	
	public OrderBean findByID(String OrderID){
		return orderDAO.findByID(OrderID);
	}
	
	public List<OrderBean> getAll(){
		return orderDAO.getAll();
	}
	
	public String getLastID(){
		return orderDAO.getLastID();
	}
	
	public List<OrderBean> getAllbyMemberID(String MemberID) {
		return orderDAO.getAllbyMemberID(MemberID);
	}
	

}
