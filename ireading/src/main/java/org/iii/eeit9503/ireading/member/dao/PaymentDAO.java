package org.iii.eeit9503.ireading.member.dao;

import java.util.List;

import org.iii.eeit9503.ireading.member.bean.PaymentBean;


public interface PaymentDAO {
	public int insert(PaymentBean paymentBean);
	public int update(PaymentBean paymentBean);
	public int delete(String ProductID);
	public PaymentBean findByProductID(String  ProductID);
	public List<PaymentBean> findByMemberID(String  MemberID);
	public List<PaymentBean> getAll();
}
