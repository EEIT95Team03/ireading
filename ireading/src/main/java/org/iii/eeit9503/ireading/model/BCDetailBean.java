package org.iii.eeit9503.ireading.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BCDetail")
public class BCDetailBean implements Serializable{
	@Id
	private String ISBN; //PK, FK
	@Id
	private String BCID; //PK, FK
	private int BookRank; 	
	
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
	public int getBookRank() {
		return BookRank;
	}
	public void setBookRank(int bookRank) {
		BookRank = bookRank;
	}	
	
	

	
}
