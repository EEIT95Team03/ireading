package org.iii.eeit9503.ireading.product.model;

import java.util.List;

import org.iii.eeit9503.ireading.product.bean.SellListBean;
import org.iii.eeit9503.ireading.product.dao.SellListDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SellListService {
 @Autowired
	private SellListDAO sellListDAO;
	
	public int insert(SellListBean sellListBean){
		return sellListDAO.insert(sellListBean);
	}
	
	public int update(SellListBean sellListBean){
		return sellListDAO.update(sellListBean);
	}
	
	public int delete(String SellListID){
		return sellListDAO.delete(SellListID);
		
	}
	
	public SellListBean findByPrimaryKey(String SellListID){
		return sellListDAO.findByPrimaryKey(SellListID);
	}
	
	public List<SellListBean> getAll(){
		return sellListDAO.getAll();
	}

	
}
