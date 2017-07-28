package org.iii.eeit9503.ireading.product.model;

import java.util.List;

import org.iii.eeit9503.ireading.product.bean.ProductStatusBean;
import org.iii.eeit9503.ireading.product.dao.ProductStatusDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductStatusService {
	@Autowired
	private ProductStatusDAO productStatusDAO;
	
	public int insert(ProductStatusBean productStatusBean){
		return productStatusDAO.insert(productStatusBean);
	}
	
	public int update(ProductStatusBean productStatusBean){
		return productStatusDAO.update(productStatusBean);
	}
	
	public int delete(String StatusID){
		return productStatusDAO.delete(StatusID);
	}
	
	public ProductStatusBean findByPrimaryKey(String StatusID){
		return productStatusDAO.findByPrimaryKey(StatusID);
	}
	
	public List<ProductStatusBean> getAll(){
		return productStatusDAO.getAll();
	}

}
