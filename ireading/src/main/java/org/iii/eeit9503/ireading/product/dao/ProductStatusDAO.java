package org.iii.eeit9503.ireading.product.dao;

import java.util.List;
import org.iii.eeit9503.ireading.product.bean.ProductStatusBean;

public interface ProductStatusDAO {
	public int insert(ProductStatusBean productStatusBean);
	public int update(ProductStatusBean productStatusBean);
	public int delete(String StatusID);
	public ProductStatusBean findByPrimaryKey(String StatusID);
	public List<ProductStatusBean> getAll();
}
