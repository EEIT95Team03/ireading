package org.iii.eeit9503.ireading.product.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SellListStatus")
public class SellListStatusBean {
	@Id
	private String StatusID;
	private String StatusName;
	
	public String getStatusID() {
		return StatusID;
	}
	public void setStatusID(String statusID) {
		StatusID = statusID;
	}
	public String getStatusName() {
		return StatusName;
	}
	public void setStatusName(String statusName) {
		StatusName = statusName;
	}
	
	

}
