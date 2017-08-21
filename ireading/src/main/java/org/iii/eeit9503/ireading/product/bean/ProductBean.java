package org.iii.eeit9503.ireading.product.bean;

import java.sql.Date;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.iii.eeit9503.ireading.book.bean.BooksBean;


@Entity
@Table(name = "Product")
public class ProductBean {
	@Id
	private String ProductID;
	private String StatusID;
	private String SellListID;
	private int ProductPrice;
    private String Digital;
    private String Detail;
	private String Status;
	private Date Arrival;
	private Date Expiration;
	@ManyToOne
	@JoinColumn(name="ISBN")
	private BooksBean booksBean;
	
	public String getProductID() {
		return ProductID;
	}
	public void setProductID(String productID) {
		ProductID = productID;
	}
	public String getStatusID() {
		return StatusID;
	}
	public void setStatusID(String statusID) {
		StatusID = statusID;
	}
	public String getSellListID() {
		return SellListID;
	}
	public void setSellListID(String sellListID) {
		SellListID = sellListID;
	}
	public int getProductPrice() {
		return ProductPrice;
	}
	public void setProductPrice(int productPrice) {
		ProductPrice = productPrice;
	}

	public String getDigital() {
		return Digital;
	}
	public void setDigital(String digital) {
		Digital = digital;
	}
	public String getDetail() {
		return Detail;
	}
	public void setDetail(String detail) {
		Detail = detail;
	}
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Date getArrival() {
		return Arrival;
	}
	public void setArrival(Date arrival) {
		Arrival = arrival;
	}
	public Date getExpiration() {
		return Expiration;
	}
	public void setExpiration(Date expiration) {
		Expiration = expiration;
	}
	
	
	public BooksBean getBooksBean() {
		return booksBean;
	}
	public void setBooksBean(BooksBean booksBean) {
		this.booksBean = booksBean;
	}
	
	public boolean equals(Object obj) {
        if(obj == this) {
            return true;
        }
 
        if(!(obj instanceof ProductBean)) {
            return false;
        }
		return false;
 
    }

}
	// 必須重新定義equals()與hashCode()
//	public boolean equals(Object obj){
//		if(obj==this){
//			return true;
//			}		
//		if(!(obj instanceof ProductBean)){
//			return false;
//			}
//		ProductBean productBean =(ProductBean)obj;
//		return new 
//				
//	}
