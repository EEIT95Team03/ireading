package org.iii.eeit9503.ireading.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="Review")
public class ReviewBean implements Serializable{
	@Id
	private String MemberID; //PK, FK
	@Id
	private String ISBN; //PK, FK
	private int Rate;
	private String Cont;
	private java.util.Date PostTime;
	
	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public int getRate() {
		return Rate;
	}
	public void setRate(int rate) {
		Rate = rate;
	}
	public String getCont() {
		return Cont;
	}
	public void setCont(String cont) {
		Cont = cont;
	}
	public java.util.Date getPostTime() {
		return PostTime;
	}
	public void setPostTime(java.util.Date postTime) {
		PostTime = postTime;
	}
	
	
	

}
