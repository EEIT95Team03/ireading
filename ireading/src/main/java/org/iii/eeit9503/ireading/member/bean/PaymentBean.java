package org.iii.eeit9503.ireading.member.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;
import org.iii.eeit9503.ireading.product.bean.ProductBean;

@Entity
@Table(name="Payment")
public class PaymentBean implements Serializable{
	@Id
	@OneToOne
	@JoinColumn(name="ProductID")
	private ProductBean productBean;
	private String MemberID;
	private double Amount;
	private Timestamp Paytime;
	
	
	public ProductBean getProductBean() {
		return productBean;
	}
	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	public double getAmount() {
		return Amount;
	}
	public void setAmount(double amount) {
		Amount = amount;
	}
	public Timestamp getPaytime() {
		return Paytime;
	}
	public void setPaytime(Timestamp paytime) {
		Paytime = paytime;
	}

}
