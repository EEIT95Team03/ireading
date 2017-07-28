package org.iii.eeit9503.ireading.order.model;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.PayBean;
import org.iii.eeit9503.ireading.order.dao.OrderDAO;
import org.iii.eeit9503.ireading.order.dao.PayDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	
	
	public int insert(PayBean paybean){
			return  payDAO.insert(paybean);
	}
	
	public int update(PayBean paybean){
		return  payDAO.update(paybean);
	}
	
	public int delete(String payID){
		return  payDAO.delete(payID);
	}
	
	public PayBean findByID(String payID){
		return payDAO.findByID(payID);
	}
	
	public List<PayBean> getAll(){
		return  payDAO.getAll();
	}
	
	
}
