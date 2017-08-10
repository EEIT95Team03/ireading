package org.iii.eeit9503.ireading.bookcase.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BCDetailDAOHibernate implements BCDetailDAO {	

	public static final String SelectBook ="from BCDetailBean where BCID=:BCID";
	public static final String SelectBC ="from BCDetailBean where BCID=:BCID and ISBN=:ISBN";
	public static final String getSelectBCID="select * from BCDetail order by BCID ASC";
	
	@Autowired
	private SessionFactory sessoionFactory = null;
	@Autowired
	public Session getSession(){
		return sessoionFactory.getCurrentSession();
	}
	
	@Override
	public BCDetailBean select(String ISBN, String BCID) {
		return this.getSession().get(BCDetailBean.class, BCID);
	}

	@Override
	public List<BCDetailBean> select() {
		Query query = this.getSession().createSQLQuery(getSelectBCID);
		List<BCDetailBean>list = query.list();
		return list;
	}

	@Override
	public BCDetailBean insert(BCDetailBean bCDetailBean) {
		if(bCDetailBean!=null){
			Query query=this.getSession().createQuery(SelectBC);
			query.setParameter("BCID", bCDetailBean.getBCID());
			query.setParameter("BCID", bCDetailBean.getBooksBean().getISBN());			
			if(query.list()==null){
				this.getSession().save(bCDetailBean);
				return bCDetailBean;
			}		}
		return null;
	}

//	@Override
//	public BCDetailBean update(String ISBN, String BCID, int BookRank) {
//		BCDetailBean result = (BCDetailBean)this.getSession().get(ISBN, BCID);
//		if(result!=null){
//			result.setISBN(ISBN);
//			result.setBCID(BCID);
//			result.setBookRank(BookRank);
//		}
//		return result;
//	}

//	@Override
//	public int delete(String ISBN) {
//		BCDetailBean bean = (BCDetailBean)this.getSession().get(ISBN, BCID);
//		if(bean!=null){
//			this.getSession().delete(bean);
//			return true;
//		}
//		return false;
//	}
	
	@Override
	public int delete(String ISBN ,String BCID) {
		try {
			   Session session = this.getSession();
			   Query query = session.createQuery("delete from BCDetailBean where ISBN=? and BCID=?");
			   System.out.println(ISBN);
			   query.setParameter(0, ISBN);
			   query.setParameter(1, BCID);
			   int delete = query.executeUpdate();
			   System.out.println("success");
			   return delete;
			  } catch (Exception e) {
				  System.out.println("failed");
			   return 0;
			  }
			 }

	@Override
	public List<BCDetailBean> findbyBCID(String BCID) {
		Query query=this.getSession().createQuery(SelectBook);
		query.setParameter("BCID", BCID);
		List<BCDetailBean> list=query.list();
		
		return list;
	}
	
	
}