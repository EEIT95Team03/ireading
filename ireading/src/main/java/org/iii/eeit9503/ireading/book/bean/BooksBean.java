package org.iii.eeit9503.ireading.book.bean;

import java.util.Base64;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Books")
public class BooksBean {
	@Id
	private String ISBN;
//	 @ManyToOne
//	 @JoinColumn(name="CategoryID")
//	 private CategoryBean categoryBean;
	
	private String CategoryID;
	
	private String Title;
	
	private byte[] Cover;
	
	private String Author;
	
	private String Publisher;
	
	private int Language;
	
	private Date Pub_Date;
	
	private int Ori_Price;
	
	@Column(name = "Abstract")
	private String Abstracts;
	
	private int Click;
	
	private double RateAvg;
	
//	private String Img;
//
//	public String getImg() {
//		return Img;
//	}
//
//	public void setImg(String img) {
//		Img = img;
//	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public byte[] getCover() {
		return Cover;
	}

	public void setCover(byte[] cover) {
		Cover = cover;
	}
	
	public String getByteArrayString(){
		String out=null;
		if(this.Cover!=null){
			out = Base64.getEncoder().encodeToString(this.Cover);
			System.out.println(out);
		}
		return out;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String author) {
		Author = author;
	}

	public String getPublisher() {
		return Publisher;
	}

	public void setPublisher(String publisher) {
		Publisher = publisher;
	}

	public int getLanguage() {
		return Language;
	}

	public void setLanguage(int language) {
		Language = language;
	}

	public Date getPub_Date() {
		return Pub_Date;
	}

	public void setPub_Date(Date pub_Date) {
		Pub_Date = pub_Date;
	}

	public int getOri_Price() {
		return Ori_Price;
	}

	public void setOri_Price(int ori_Price) {
		Ori_Price = ori_Price;
	}

	public String getAbstracts() {
		return Abstracts;
	}

	public void setAbstracts(String abstracts) {
		Abstracts = abstracts;
	}

	public int getClick() {
		return Click;
	}

	public void setClick(int click) {
		Click = click;
	}

	public Double getRateAvg() {
		return RateAvg;
	}

	public void setRateAvg(Double rateAvg) {
		RateAvg = rateAvg;
	}

//	public CategoryBean getCategoryBean() {
//		return categoryBean;
//	}
//
//	public void setCategoryBean(CategoryBean categoryBean) {
//		this.categoryBean = categoryBean;
//	}

	public void setRateAvg(double rateAvg) {
		RateAvg = rateAvg;
	}

	public String getCategoryID() {
		return CategoryID;
	}

	public void setCategoryID(String categoryID) {
		CategoryID = categoryID;
	}

}
