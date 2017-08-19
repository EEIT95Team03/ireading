package org.iii.eeit9503.ireading.product.bean;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name ="SellList")
public class SellListBean {
	
@Id	
 private String SellListID;
 private String MemberID;
 private String StatusID;
 private Timestamp ApplyDate;
 
public String getSellListID() {
	return SellListID;
}
public void setSellListID(String sellListID) {
	SellListID = sellListID;
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
public Timestamp getApplyDate() {
	return ApplyDate;
}
public void setApplyDate(Timestamp applyDate) {
	ApplyDate = applyDate;
}



}
