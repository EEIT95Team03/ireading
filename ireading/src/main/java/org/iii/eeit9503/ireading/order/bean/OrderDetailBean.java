package org.iii.eeit9503.ireading.order.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetail")
public class OrderDetailBean implements Serializable{
@Id
private String OrderID;
@Id	
private String ProductID;

public String getOrderID() {
	return OrderID;
}
public void setOrderID(String orderID) {
	OrderID = orderID;
}
public String getProductID() {
	return ProductID;
}
public void setProductID(String productID) {
	ProductID = productID;
}

}
