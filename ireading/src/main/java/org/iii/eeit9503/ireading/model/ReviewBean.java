package org.iii.eeit9503.ireading.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="[ireadDB].[dbo].[Review]")
public class ReviewBean {
	@Id
	private String MemberID;
	@Id
	private String ISBN;
	private int Rate;
	private String Content;
	private Date PostTime;
	
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
	public Date getPostTime() {
		return PostTime;
	}
	public void setPostTime(Date postTime) {
		PostTime = postTime;
	}
	public void setPostTime(SimpleDateFormat dateFormat) {		
		
	}


}
