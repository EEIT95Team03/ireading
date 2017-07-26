package model;

import java.sql.Date;

public class ProductBean {
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
	
}	
