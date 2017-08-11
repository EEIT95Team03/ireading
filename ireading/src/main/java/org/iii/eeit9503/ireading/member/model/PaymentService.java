package org.iii.eeit9503.ireading.member.model;

import java.util.List;
import org.iii.eeit9503.ireading.member.bean.PaymentBean;
import org.iii.eeit9503.ireading.member.dao.PaymentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;
	
	public int insert(PaymentBean paymentBean){
		return paymentDAO.insert(paymentBean);
	}
	
	public int update(PaymentBean paymentBean){
		return paymentDAO.update(paymentBean);
	}
	
	public int delete(String ProductID){
		return paymentDAO.delete(ProductID);
	}
	
	public PaymentBean findByProductID(String  ProductID){
		return paymentDAO.findByProductID(ProductID);
	}
	
	public List<PaymentBean> findByMemberID(String  MemberID){
		return paymentDAO.findByMemberID(MemberID);
	}
	
	public List<PaymentBean> findByMemberIDandMonth(String MemberID, String month) {
		
		return paymentDAO.findByMemberIDandMonth(MemberID, month);
	}
	
	public List<PaymentBean> getAll(){
		return paymentDAO.getAll();
	}
}
