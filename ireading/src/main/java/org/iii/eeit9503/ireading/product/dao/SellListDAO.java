package org.iii.eeit9503.ireading.product.dao;

import java.util.List;
import org.iii.eeit9503.ireading.product.bean.SellListBean;

public interface SellListDAO {
	public int insert(SellListBean sellListBean);
	public int update(SellListBean sellListBean);
	public int delete(String SellListID);
	public SellListBean findByPrimaryKey(String SellListID);
	public List<SellListBean> getAll();
}
