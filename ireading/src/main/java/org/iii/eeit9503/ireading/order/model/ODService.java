package org.iii.eeit9503.ireading.order.model;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.ODBean;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.dao.ODDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ODService {

	@Autowired
	private ODDAO odDAO;
	
	public int insert(ODBean odbean){
		 
		if(odDAO.check(odbean)==0){
		return odDAO.insert(odbean);}
		else{return 0;}
	}
	
	public int update(ODBean odbean){
		
		return odDAO.update(odbean);
	}
	
	public int delete(String OrderID, String ProductID){
		return odDAO.delete(OrderID, ProductID);	
	}
	
	public List<ODBean> findByOrderID(String OrderID) {
		return odDAO.findByOrderID(OrderID);	}
	
	
	public List<ODBean> findByProductID(String ProductID) {
		return odDAO.findByProductID(ProductID);	}
	
	
	public int delete(ODBean odbean){
		return odDAO.delete(odbean.getOrderID(), odbean.getProductID());	
	}
	
	public List<ODBean> getAll(){
		
		return odDAO.getAll();
	}
	
	

}
