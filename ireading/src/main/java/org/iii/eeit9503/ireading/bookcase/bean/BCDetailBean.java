package org.iii.eeit9503.ireading.bookcase.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.iii.eeit9503.ireading.book.bean.BooksBean;

@Entity
@Table(name = "BCDetail")
public class BCDetailBean implements Serializable{
	@Id
	@ManyToOne
	@JoinColumn(name="ISBN")
	private BooksBean booksBean; //PK, FK
	@Id
	private String BCID; //PK, FK
	private int BookRank; 	
	

	public BooksBean getBooksBean() {
		return booksBean;
	}
	public void setBooksBean(BooksBean booksBean) {
		this.booksBean = booksBean;
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
