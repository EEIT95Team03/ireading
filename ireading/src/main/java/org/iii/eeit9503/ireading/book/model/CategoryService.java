package org.iii.eeit9503.ireading.book.model;

import java.util.List;

import org.iii.eeit9503.ireading.book.bean.CategoryBean;
import org.iii.eeit9503.ireading.book.dao.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;
	
	public int insert(CategoryBean categoryBean){
		 
		return categoryDAO.insert(categoryBean);
	}
	
	public int update(CategoryBean categoryBean){
		return categoryDAO.update(categoryBean);
	}
	
	public int delete(String CategoryID){
		return categoryDAO.delete(CategoryID);
	}
	
	public CategoryBean findByID(String CategoryID){
		return categoryDAO.findByID(CategoryID);
	}
	
	public List<CategoryBean> getAll(){
		return categoryDAO.getAll();
	}
	

}
