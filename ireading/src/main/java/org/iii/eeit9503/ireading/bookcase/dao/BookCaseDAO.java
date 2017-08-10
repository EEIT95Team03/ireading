package org.iii.eeit9503.ireading.bookcase.dao;

import java.util.List;

import javax.persistence.Id;

import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;

public interface BookCaseDAO {
	public abstract BookCaseBean select(String BCID);

	public abstract List<BookCaseBean> select();	

	public abstract BookCaseBean update(BookCaseBean bookCaseBean);
	
	public abstract int insert(BookCaseBean bookCaseBean);

	public abstract int delete(String BCID);
	
	public abstract List<BookCaseBean> selectMemberID(String MemberID);
	
	public abstract BookCaseBean findByBCID(String BCID);
	
	public abstract String getlastID();
	
	

	
}
