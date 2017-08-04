package org.iii.eeit9503.ireading.order.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class OrderBean {
@Id
private String OrderID;
@ManyToOne
@JoinColumn(name="PayID")
private PayBean payBean;
private String MemberID;
@ManyToOne
@JoinColumn(name="StatusID")
private OrderStatusBean orderStatusBean;
private String Invoice;
private String Oaddr;
private java.sql.Timestamp Odate;
private int Ototal;
private String Omemo;
private String Reciepient;
private int Paid;

public String getOrderID() {
	return OrderID;
}
public void setOrderID(String orderID) {
	OrderID = orderID;
}
public PayBean getPayBean() {
	return payBean;
}
public void setPayBean(PayBean payBean) {
	this.payBean = payBean;
}
public String getMemberID() {
	return MemberID;
}
public void setMemberID(String memberID) {
	MemberID = memberID;
}
public OrderStatusBean getOrderStatusBean() {
	return orderStatusBean;
}
public void setOrderStatusBean(OrderStatusBean orderStatusBean) {
	this.orderStatusBean = orderStatusBean;
}
public String getInvoice() {
	return Invoice;
}
public void setInvoice(String invoice) {
	Invoice = invoice;
}
public String getOaddr() {
	return Oaddr;
}
public void setOaddr(String oaddr) {
	Oaddr = oaddr;
}

public java.sql.Timestamp getOdate() {
	return Odate;
}
public void setOdate(java.sql.Timestamp odate) {
	Odate = odate;
}
public int getOtotal() {
	return Ototal;
}
public void setOtotal(int ototal) {
	Ototal = ototal;
}
public String getOmemo() {
	return Omemo;
}
public void setOmemo(String omemo) {
	Omemo = omemo;
}
public String getReciepient() {
	return Reciepient;
}
public void setReciepient(String reciepient) {
	Reciepient = reciepient;
}
public int getPaid() {
	return Paid;
}
public void setPaid(int paid) {
	Paid = paid;
}





}
