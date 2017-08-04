package org.iii.eeit9503.ireading.order.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.iii.eeit9503.ireading.product.bean.ProductBean;

@Entity
@Table(name = "OrderDetail")
public class OrderDetailBean implements Serializable{
@Id
private String OrderID;
@Id
@ManyToOne
@JoinColumn(name="ProductID")
private ProductBean productBean;

public String getOrderID() {
	return OrderID;
}
public void setOrderID(String orderID) {
	OrderID = orderID;
}
public ProductBean getProductBean() {
	return productBean;
}
public void setProductBean(ProductBean productBean) {
	this.productBean = productBean;
}


}
