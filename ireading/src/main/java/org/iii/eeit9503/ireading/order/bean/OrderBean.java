package org.iii.eeit9503.ireading.order.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class OrderBean {
@Id
private String OrderID;
private String PayID;
private String MemberID;
private String StatusID;
private String Invoice;
private String Oaddr;
private java.sql.Date Odate;
private int Ototal;
private String Omemo;
private String Reciepient;

public String getOrderID() {
	return OrderID;
}
public void setOrderID(String orderID) {
	OrderID = orderID;
}
public String getPayID() {
	return PayID;
}
public void setPayID(String payID) {
	PayID = payID;
}
public String getMemberID() {
	return MemberID;
}
public void setMemberID(String memberID) {
	MemberID = memberID;
}
public String getStatusID() {
	return StatusID;
}
public void setStatusID(String statusID) {
	StatusID = statusID;
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
public java.sql.Date getOdate() {
	return Odate;
}
public void setOdate(java.sql.Date odate) {
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



}
