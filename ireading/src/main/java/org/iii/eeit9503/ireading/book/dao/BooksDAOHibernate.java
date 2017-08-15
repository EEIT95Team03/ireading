package org.iii.eeit9503.ireading.book.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class BooksDAOHibernate implements BooksDAO {
	
	public static final String get_Bookslist = "from BooksBean";
	
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private CategoryDAO categoryDAO;
	

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public BooksBean select(String ISBN) {
		return this.getSession().get(BooksBean.class, ISBN);
	}
	
	@Override
	public BooksBean findByID(String ISBN) {
		  try {
		   Session session = this.getSession();
		   BooksBean bean = session.get(BooksBean.class, ISBN);

		   return bean;
		  } catch (Exception e) {

		   return null;
		  }
		 }
	
	@Override
	public List<BooksBean> select() {
		System.out.println("dao select here");
//		return this.getSession().createQuery(
//				"from BooksBean", BooksBean.class).getResultList();
		Criteria criteria = this.getSession().createCriteria(BooksBean.class);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<BooksBean> list = criteria.list();
		return list;

	}

	@Override
	public int insert(BooksBean booksBean) {
		// TODO Auto-generated method stub
		try {
			
			Session session = this.getSession();
			
			BooksBean bean=session.get(BooksBean.class, booksBean.getISBN());
			
			session.saveOrUpdate(booksBean);
			return 1;
			
//			if(bean==null){
//			session.saveOrUpdate(booksBean);
//
//			return 1;}
//			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public BooksBean update(BooksBean bean) {
		BooksBean booksBean;
		if (bean != null) {
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;
	}
	
	
	@Override
	public int delete(String ISBN) {
		try {
			   Session session = this.getSession();

			   Query query = session.createQuery("delete from BooksBean where ISBN=?");
			   query.setParameter(0, ISBN);
			   int delete = query.executeUpdate();

			   return delete;
			  } catch (Exception e) {
			   // TODO: handle exception

			   return 0;
			  }
			 }

	@Override
	public Object getCover(String ISBN) {
		try {
			   Session session = this.getSession();

			   Query query = session.createSQLQuery("select Cover from Books where ISBN=:ISBN");
			   query.setParameter("ISBN", ISBN);
			   List<Object> list= query.list();
               
			   return list.get(0);
			  } catch (Exception e) {
			   // TODO: handle exception

			   return null;
			  }
	}

	@Override
	public Object getClick(String ISBN) {
		try {
			   Session session = this.getSession();

			   Query query = session.createSQLQuery("select Click from Books where ISBN=:ISBN");
			   query.setParameter("ISBN", ISBN);
			   List<Object> list= query.list();
            
			   return list.get(0);
			  } catch (Exception e) {
			   // TODO: handle exception

			   return null;
			  }
	}

	@Override
	public Object getRateAvg(String ISBN) {
		try {
			   Session session = this.getSession();

			   Query query = session.createSQLQuery("select RateAvg from Books where ISBN=:ISBN");
			   query.setParameter("ISBN", ISBN);
			   List<Object> list= query.list();
            
			   return list.get(0);
			  } catch (Exception e) {
			   // TODO: handle exception

			   return null;
			  }
	}

} // class BooksDAOHibernate
