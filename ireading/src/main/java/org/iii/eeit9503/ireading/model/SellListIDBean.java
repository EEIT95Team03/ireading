package org.iii.eeit9503.ireading.model;

import java.sql.Date;

public class SellListIDBean {
 private String SellListID;
 private String MemberID;
 private String StatusID;
 private Date ApplyDate;
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
public Date getApplyDate() {
	return ApplyDate;
}
public void setApplyDate(Date applyDate) {
	ApplyDate = applyDate;
}
}
