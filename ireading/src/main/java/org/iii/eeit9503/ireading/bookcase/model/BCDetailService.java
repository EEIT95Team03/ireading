package org.iii.eeit9503.ireading.bookcase.model;

import java.util.ArrayList;
import java.util.List;

import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.bookcase.dao.BCDetailDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BCDetailService {
	
	@Autowired
	private BCDetailDAO bcDetailDAO;
	
	public List<BCDetailBean> select(BCDetailBean bean){
		List<BCDetailBean>result = null;
		if(bean!=null && bean.getBCID()!="" && bean.getBooksBean().getISBN()!=""){
			BCDetailBean temp = bcDetailDAO.select(bean.getBCID(), bean.getBooksBean().getISBN());
			if(temp!=null) {
				result = new ArrayList<BCDetailBean>();
				result.add(temp);
			}
		} else {
			result = bcDetailDAO.select(); 
		}
		return result;
	}
	
	public BCDetailBean insert(BCDetailBean bean){		 
		BCDetailBean result = null;				
		if(bean!=null) {			
			result = bcDetailDAO.insert(bean);
		}
		return result;
	}
	
	public BCDetailBean update(BCDetailBean bean){
		BCDetailBean result = null;
		if(bean!=null) {
		}
		return result;
	}
	
	public int delete(String ISBN,String BCID){
		int result = 0;
		if(ISBN!=null) {
			result = bcDetailDAO.delete(ISBN,BCID);
		}
		return result;
	}			
	
	public List<BCDetailBean> findbyBCID(String BCID){
		return bcDetailDAO.findbyBCID(BCID);
	}
	
}
