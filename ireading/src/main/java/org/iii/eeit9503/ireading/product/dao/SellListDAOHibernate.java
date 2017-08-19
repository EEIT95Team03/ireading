package org.iii.eeit9503.ireading.product.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.product.bean.SellListBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class SellListDAOHibernate implements SellListDAO{

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public int insert(SellListBean sellListBean) {
try {
			
			Session session = this.getSession();

			session.saveOrUpdate(sellListBean);

			return 1;
		} catch (Exception e) {	
			return 0;
		} 
	
	}

	@Override
	public int update(SellListBean sellListBean) {
		try {
			Session session = this.getSession();

			session.saveOrUpdate(sellListBean);

			return 1;
		} catch (Exception e) {
		
			return 0;
		} 
	}

	@Override
	public int delete(String SellListID) {
		try {
			Session session = this.getSession();
			Query query = session.createQuery("delete from SellListBean where SellListID=:SellListID");
			query.setParameter("SellListID", SellListID);
			int delete = query.executeUpdate();

			return delete;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		} 
	}

	@Override
	public SellListBean findByPrimaryKey(String SellListID) {
		try {
			Session session = this.getSession();

			SellListBean bean = session.get(SellListBean.class, SellListID);

			return bean;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		} 
	}

	@Override
	public List<SellListBean> getAll() {
		try {
			Session session = this.getSession();
			Query query = session.createQuery("from SellListBean");
			List<SellListBean> list= query.list();

			return list;
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public String getLastID() {
		try {
			Session session = this.getSession();

			Query query = session.createSQLQuery("select Top 1 SellListID from SellList order by SellListID DESC");
			String ID=null;
			List<Object> list= query.list();
			for(Object obj:list){
				ID=(String) obj;				
			}

			return ID;
		} catch (Exception e) {
			return null;
		}
	}

}
