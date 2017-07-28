package org.iii.eeit9503.ireading.product.model;

import java.util.List;

import org.iii.eeit9503.ireading.product.bean.SellListStatusBean;
import org.iii.eeit9503.ireading.product.dao.SellListStatusDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellListStatusService {
	@Autowired
	private SellListStatusDAO sellListStatusDAO;
	
	public int insert(SellListStatusBean sellListStatusBean){
		return sellListStatusDAO.insert(sellListStatusBean);
	}
	
	public int update(SellListStatusBean sellListStatusBean){
		return sellListStatusDAO.update(sellListStatusBean);
	}
	
	public int delete(String StatusID){
		return sellListStatusDAO.delete(StatusID);
	}
	
	public SellListStatusBean findByPrimaryKey(String StatusID){
		return sellListStatusDAO.findByPrimaryKey(StatusID);
	}
	
	public List<SellListStatusBean> getAll(){
		return sellListStatusDAO.getAll();
	}
}
