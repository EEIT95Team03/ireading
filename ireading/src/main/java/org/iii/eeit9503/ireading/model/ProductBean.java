package org.iii.eeit9503.ireading.model;

import java.sql.Date;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

@Entity
@Table(name = "[ireadDB].[dbo].[Product]")
public class ProductBean implements Serializable{
	@Id
	private String ProductID;
	private String StatusID;
	private String SellListID;
	private int ProductPrice;
    private byte[] Digital;
    private String Detail;
	private String Staus;
	private Date Arrival;
	private Date Expiration;
	
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
	public byte[] getDigital() {
		return Digital;
	}
	public void setDigital(byte[] digital) {
		Digital = digital;
	}
	public String getDetail() {
		return Detail;
	}
	public void setDetail(String detail) {
		Detail = detail;
	}
	public String getStaus() {
		return Staus;
	}
	public void setStaus(String staus) {
		Staus = staus;
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
