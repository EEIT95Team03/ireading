package org.iii.eeit9503.ireading.model;

import java.sql.Date;

public class PaymentBean {
	private String ProductID;
	private String MemberID;
	private int Amount;
	private Date Paytime;
	public String getProductID() {
		return ProductID;
	}
	public void setProductID(String productID) {
		ProductID = productID;
	}
	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public Date getPaytime() {
		return Paytime;
	}
	public void setPaytime(Date paytime) {
		Paytime = paytime;
	}
}
