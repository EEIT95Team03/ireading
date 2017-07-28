package org.iii.eeit9503.ireading.product.dao;

import java.util.List;

import org.iii.eeit9503.ireading.product.bean.SellListStatusBean;

public interface SellListStatusDAO {
	public int insert(SellListStatusBean sellListStatusBean);
	public int update(SellListStatusBean sellListStatusBean);
	public int delete(String StatusID);
	public SellListStatusBean findByPrimaryKey(String StatusID);
	public List<SellListStatusBean> getAll();
	
}
