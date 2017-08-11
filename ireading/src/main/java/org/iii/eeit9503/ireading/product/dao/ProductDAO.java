package org.iii.eeit9503.ireading.product.dao;

import java.util.List;

import org.iii.eeit9503.ireading.product.bean.ProductBean;

public interface ProductDAO {
	public int insert(ProductBean ProductBean);
	public int update(ProductBean ProdcutBean);
	public boolean delete(String ProductID);
	public ProductBean findByPrimaryKey(String ProductID);
	public List<ProductBean> findByISBN(String ISBN);
	public List<ProductBean> getAll();
	public String getLastID();
	public ProductBean select(String ProductID);
}
