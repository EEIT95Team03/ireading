package org.iii.eeit9503.ireading.order.model;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.dao.OrderDetailDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {

	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	public int insert(OrderDetailBean orderDetailbean){
		 
		if(orderDetailDAO.check(orderDetailbean)==0){
		return orderDetailDAO.insert(orderDetailbean);}
		else{return 0;}
	}
	
	public int update(OrderDetailBean orderDetailbean){
		
		return orderDetailDAO.update(orderDetailbean);
	}
	
	public int delete(String OrderID, String ProductID){
		return orderDetailDAO.delete(OrderID, ProductID);	
	}
	
	public List<OrderDetailBean> findByOrderID(String OrderID) {
		return orderDetailDAO.findByOrderID(OrderID);	}
	
	
	public List<OrderDetailBean> findByProductID(String ProductID) {
		return orderDetailDAO.findByProductID(ProductID);	}
	
	public List<OrderDetailBean> findByID(String OrderID,String ProductID) {
		return orderDetailDAO.findByID(OrderID,ProductID);	}
	
	public int delete(OrderDetailBean orderDetailbean){
		return orderDetailDAO.delete(orderDetailbean.getOrderID(), orderDetailbean.getProductBean().getProductID());	
	}
	
	public List<OrderDetailBean> getAll(){
		
		return orderDetailDAO.getAll();
	}
	
	

}
