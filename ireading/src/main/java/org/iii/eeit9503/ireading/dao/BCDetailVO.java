package org.iii.eeit9503.ireading.dao;

public class BCDetailVO {	
	private String ISBN; //PK, FK
	private String BCID; //PK, FK
	private short BookRank; 	
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		this.ISBN = iSBN;
	}
	public String getBCID() {
		return BCID;
	}
	public void setBCID(String bCID) {
		this.BCID = bCID;
	}
	public short getBookRank() {
		return BookRank;
	}
	public void setBookRank(short bookRank) {
		this.BookRank = bookRank;
	}
	
	

	
}
