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
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public static final String GET_ALL_STMT = "from BCDetailBean order by BCID";

	@Override
	public int insert(BCDetailBean bean) {
		// session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			Session session = this.getSession();

			session.saveOrUpdate(bean);
			return 1;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return 0;
		}

	}

	@Override
	public int update(BCDetailBean bean) {
		// session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			Session session = this.getSession();

			session.saveOrUpdate(bean);

			return 1;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return 0;
		}

	}

	@Override
	public int delete(String ISBN, String BCID) {
		// session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			Session session = this.getSession();

			 Query query=session.createQuery("delete from BCDetailBean where ISBN=:ISBN and BCID=:BCID");
	            query.setParameter("ISBN", ISBN);
				query.setParameter("BCID", BCID);
				int update=query.executeUpdate();
				
			return update;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		}


	@Override
	public List<BCDetailBean> findByBCID(String BCID){
		try {
			Session session = this.getSession();
			Query query = session.createQuery("from BCDetailBean where BCID=:BCID");
			query.setParameter("BCID", BCID);
            
			List<BCDetailBean> list=query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<BCDetailBean> getAll() {
		try {
			Session session = this.getSession();
			
			Query query = session.createQuery(GET_ALL_STMT);
			List<BCDetailBean> list  = query.list();
			
			return list;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		}
	}

}
