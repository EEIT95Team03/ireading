package org.iii.eeit9503.ireading.book.model;

import java.util.ArrayList;
import java.util.List;

import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.dao.BooksDAOHibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooksService {
	@Autowired
	private BooksDAOHibernate booksDAO;
	
	public List<BooksBean> select(BooksBean bean){
		List<BooksBean> list = null;
		System.out.println(bean.getISBN());
		
		
		if (bean != null && bean.getISBN().trim().length() != 0) {
			BooksBean temp = booksDAO.select(bean.getISBN());
			if (temp != null) {
				list = new ArrayList<BooksBean>();
				list.add(temp);
			}
		} else {
			list = booksDAO.select();
		}
		return list;
	}
	
	public BooksBean findByID(String ISBN){
		  return booksDAO.findByID(ISBN);
		 }
	
	public BooksBean insert(BooksBean booksBean) {
		try {
			booksDAO.insert(booksBean);
			System.out.println("service:" + booksBean.getISBN() + "\t" + booksBean.getTitle());
			
		} catch(Exception e) {
			e.printStackTrace();
			
			return booksBean;
		}

		return booksBean;
	}
	
	public BooksBean update(BooksBean booksBean){

		return booksDAO.update(booksBean);
	}
	
	public int delete(String ISBN){
		int result = 0;
		if(ISBN!=null) {
			result = booksDAO.delete(ISBN);
		}
		return result;
	}
	
	public Object getCover(String ISBN){
		return booksDAO.getCover(ISBN);
		
	}
	
	public Object getClick(String ISBN){
		return booksDAO.getClick(ISBN);
		
	}
	
	public Object getRateAvg(String ISBN){
		return booksDAO.getRateAvg(ISBN);
		
	}
	
}
