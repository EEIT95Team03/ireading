package org.iii.eeit9503.ireading.member.bean;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Payment")
public class PaymentBean {
	@Id
	private String ProductID;
	private String MemberID;
	private int Amount;
	private Timestamp Paytime;
	
	
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
	public Timestamp getPaytime() {
		return Paytime;
	}
	public void setPaytime(Timestamp paytime) {
		Paytime = paytime;
	}

}
