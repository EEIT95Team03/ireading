package org.iii.eeit9503.ireading.product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.dao.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	public int insert(ProductBean ProductBean){
		return productDAO.insert(ProductBean);
	}
	
	public int update(ProductBean ProdcutBean){
		return productDAO.update(ProdcutBean);
	}
	
	public boolean delete(String ProductID){
		return productDAO.delete(ProductID);
	}
	
	public ProductBean findByPrimaryKey(String ProductID){
		return productDAO.findByPrimaryKey(ProductID);
	}
	
	public List<ProductBean> findByISBN(String ISBN){
		return productDAO.findByISBN(ISBN);
	}
	
	public List<ProductBean> getAll(){
		return productDAO.getAll();
	}
	
	public List<ProductBean> getAll(ProductBean bean){
		List<ProductBean> result =null;
		if(bean!=null&& bean.getProductID()!=""){
			ProductBean temp = productDAO.select(bean.getProductID());
			if(temp!=null){
				result =new ArrayList<ProductBean>();
				result.add(temp);
			}
		}else{
			result = productDAO.getAll();
		}
		return result;
	}
	
	public String getLastID(){
		return productDAO.getLastID();
	}
	
	public List<Map<String, Object>> getPrice(String ISBN) {
		return productDAO.getPrice(ISBN);
		
	}
}
