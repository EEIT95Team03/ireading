package org.iii.eeit9503.ireading.dao;

import java.sql.SQLException;
import java.util.List;

import org.iii.eeit9503.ireading.model.ProductBean;

public interface IProductDAO {
	public void IProductDAO() throws SQLException;
	public int insert(ProductBean ProductBean)throws SQLException;
	public int update(ProductBean ProdcutBean)throws SQLException;
	public int delete(int ProductID)throws SQLException;
	public ProductBean findByPrimaryKey(int ProductID)throws SQLException;
	public List<ProductBean>getAll()throws SQLException;
	public void closeconn() throws SQLException;
	int delete(String id);
}//end of interface IProductDAO
