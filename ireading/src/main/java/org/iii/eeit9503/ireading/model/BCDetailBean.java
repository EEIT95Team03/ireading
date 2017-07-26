package org.iii.eeit9503.ireading.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "[ireadDB].[dbo].[BCDetail]")
public class BCDetailBean {
	@Id
	private String ISBN; //PK, FK
	private String BCID; //PK, FK
	private short BookRank; 	
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getBCID() {
		return BCID;
	}
	public void setBCID(String bCID) {
		BCID = bCID;
	}
	public short getBookRank() {
		return BookRank;
	}
	public void setBookRank(short bookRank) {
		BookRank = bookRank;
	}	
	
	

	
}
