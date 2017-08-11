package org.iii.eeit9503.ireading.product.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class ProductDAOHibernate implements ProductDAO{
	
	JdbcTemplate template;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public int insert(ProductBean productbean) {
		// TODO Auto-generated method stub
		try {
			Session session = this.getSession();
			
			session.saveOrUpdate(productbean);
			
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		} 
	}
	
	@Override
	public int update(ProductBean productbean){
		// TODO Auto-generated method stub
		try {			
			Session session = this.getSession();
			session.saveOrUpdate(productbean);
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		} 
	}

	@Override
	public boolean delete(String ProductID) {
		// TODO Auto-generated method stub
		ProductBean bean = (ProductBean) this.getSession().get(ProductBean.class, ProductID);
		if (bean != null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
    
	@Override
	public ProductBean findByPrimaryKey(String ProductID) {
		try {
			Session session = this.getSession();
			System.out.println(ProductID);
			ProductBean bean =session.get(ProductBean.class,ProductID);
		
			
			return bean;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
			return null;
		} 
	}

	@Override
	public List<ProductBean> getAll() {		
		List<ProductBean> list = null;
		try {
			Session session = this.getSession();
			
			Query query = session.createQuery("FROM ProductBean");
			list = query.list();
			
			return list;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<ProductBean> findByISBN(String ISBN) {
		List<ProductBean> list = null;
		try {
			Session session = this.getSession();
			
			Query query = session.createQuery("FROM ProductBean where ISBN=:ISBN and StatusID=:StatusID");
			query.setParameter("ISBN",ISBN);
			query.setParameter("StatusID","S0004");
			list = query.list();
			
			return list;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public String getLastID() {
		try {
			Session session = this.getSession();

			Query query = session.createSQLQuery("select Top 1 ProductID from Product order by ProductID DESC");
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
	
	@Override
	public ProductBean select(String ProductID) {
		return this.getSession().get(ProductBean.class, ProductID);
	}

	
	
	//JDBCTemple
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(ProductBean productBean) {
		String sql = "insert into Product(ProductID, StatusID, SellListID, ProductPrice, Digital, Detail, Status, Arrival, Expiration, ISBN) "
				+ " values('" + productBean.getProductID() + "'," + productBean.getStatusID() + ",'"
				+ productBean.getSellListID() + "'," + productBean.getStatusID() + "," + productBean.getProductPrice()
				+ "," + productBean.getDigital() + "," + productBean.getDetail() + "," + productBean.getStatus() + ","
				+ productBean.getArrival() + "," + productBean.getExpiration() + ","
				+ productBean.getBooksBean().getISBN() + ")";

		return template.update(sql);
	}

	
	
	
	public int update2(ProductBean productBean) {
		String sql = "update Product set ProductID='" + productBean.getProductID() + "', StatusID="
				+ productBean.getStatusID() + "SellListID='" + productBean.getSellListID() + "ProductPrice='" + productBean.getProductPrice() 
				+ "' where ProductID="
				+ productBean.getProductID() + "";
		return template.update(sql);

	}	
	
}
