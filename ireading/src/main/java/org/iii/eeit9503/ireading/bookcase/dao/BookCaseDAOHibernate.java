package org.iii.eeit9503.ireading.bookcase.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookCaseDAOHibernate implements BookCaseDAO {
	
	public static final String get_BookCaselist = "from BookCaseBean";	
	public static final String get_BookCaselistM = "from BookCaseBean where MemberID=:MemberID order by CaseRank,BCName";	
	public static final String get_lastID ="select top 1  BCID from BookCase order by BCID DESC";
	@Autowired
	private SessionFactory sessionFactory = null;
	
	@Autowired	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
		
	@Override
	public BookCaseBean select(String BCID) {
		return this.getSession().get(BookCaseBean.class, BCID);
	}

	@Override
	public List<BookCaseBean> select() {
		Query query=this.getSession().createQuery(get_BookCaselist);
		List<BookCaseBean> list=query.list();
		return list;
	}

	@Override
	public int insert(BookCaseBean bookCaseBean) {
		// TODO Auto-generated method stub
		try {
			
			Session session = this.getSession();			
			BookCaseBean bean=session.get(BookCaseBean.class, bookCaseBean.getBCID());
			
			if(bean==null){
			session.saveOrUpdate(bookCaseBean);

			return 1;}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}
	
	@Override
	public BookCaseBean update(BookCaseBean bookCaseBean) {
		try {			
			Session session = this.getSession();			
			
			session.update(bookCaseBean);
			
           return bookCaseBean;
		
		} catch (Exception e) {
			return null;
		}
	}



	@Override
	public int delete(String BCID) {
		try {
			   Session session = this.getSession();

			   Query query = session.createQuery("delete from BookCaseBean where BCID=?");
			   System.out.println(BCID);
			   query.setParameter(0, BCID);
			   int delete = query.executeUpdate();
			   System.out.println("success");
			   return delete;
			  } catch (Exception e) {
			   // TODO: handle exception
				  System.out.println("failed");
			   return 0;
			  }
			 }

//MemberID 查詢 個人書櫃	
	@Override
	public List<BookCaseBean> selectMemberID(String MemberID) {
		Query query = this.getSession().createQuery(get_BookCaselistM);
		query.setParameter("MemberID",MemberID);
		List<BookCaseBean>list=query.list();
		return list;
	}

//流水號
	@Override
	public String getlastID() {
		Query query = this.getSession().createSQLQuery(get_lastID);
		List<Object>  list=query.list();
		String lastID=null;
		for(Object id:list){
			lastID=(String)id;			
		}
		int  num=Integer.parseInt(lastID.substring(2));
		String fnum="0000000"+(num+1);
		fnum="BC"+fnum.substring(fnum.length()-8);
		System.out.println(fnum);
		return fnum;
	}

	@Override
	public BookCaseBean findByBCID(String BCID) {
		try {
			   Session session = this.getSession();
			   BookCaseBean bean=session.get(BookCaseBean.class,BCID);
			   
			   return bean;
			  } catch (Exception e) {
			   // TODO: handle exception
				  System.out.println("failed");
			   return null;
			  }
		
	}

	

	






}
