package org.iii.eeit9503.ireading.bookcase.model;

import java.util.List;

import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;
import org.iii.eeit9503.ireading.bookcase.dao.BCDetailDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BCDetailService {
	
	@Autowired
	private BCDetailDAO bcDetailDAO;
	
	public int insert(BCDetailBean bean){
		return bcDetailDAO.insert(bean);
	}
	
	public int update(BCDetailBean bean){
		return bcDetailDAO.update(bean);
	}
	
	public int delete(String ISBN, String BCID){
		return bcDetailDAO.delete(ISBN, BCID);
	}
	
	public List<BCDetailBean> findByBCID(String BCID){
		return bcDetailDAO.findByBCID(BCID);
	}
	
	public List<BCDetailBean>getAll(){
		return bcDetailDAO.getAll();
	}
}
