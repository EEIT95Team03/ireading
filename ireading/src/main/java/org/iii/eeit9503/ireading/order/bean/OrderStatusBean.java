package org.iii.eeit9503.ireading.order.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OrderStatus")
public class OrderStatusBean {

	@Id
	private String statusID;
	private String statusName;
	
	public String getStatusID() {
		return statusID;
	}
	public void setStatusID(String statusID) {
		this.statusID = statusID;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
	
}
