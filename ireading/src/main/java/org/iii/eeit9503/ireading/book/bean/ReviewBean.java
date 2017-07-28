package org.iii.eeit9503.ireading.book.bean;

import java.io.Serializable;
import java.sql.Timestamp;

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
	private String Content;
	private Timestamp PostTime;
	
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
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Timestamp getPostTime() {
		return PostTime;
	}
	public void setPostTime(Timestamp postTime) {
		PostTime = postTime;
	}
	
	
	

}
