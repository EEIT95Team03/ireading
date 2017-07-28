package org.iii.eeit9503.ireading.order.dao;

import java.util.List;
import org.iii.eeit9503.ireading.order.bean.PayBean;

public interface PayDAO {

	public int insert(PayBean paybean);
	public int update(PayBean paybean);
	public int delete(String payID);
	public PayBean findByID(String payID);
	public List<PayBean> getAll();
	
}
