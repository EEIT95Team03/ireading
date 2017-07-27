package org.iii.eeit9503.ireading.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.dao.IProductDAO;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.ProductBean;

public class ProductDAO {
	private static final String INSERT_STMT = "INSERT INTO Product VALUES(?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT =
	"UPDATE INTO Product SET ProductID=?, StatusID=?,SellListID=?,ProductPrice=?,Digital=?,Detail=?,Staus=?,Arrival=?,Expiration=?";
	private static final String DELETE_STMT = " DELETE Product WHERE ProductID=?";
	private static final String GET_ONE_STMT= "SELECT ProductID, StatusID,SellListID,ProductPrice,Digital,Detail,Staus,Arrival,Expiration FROM Product WHERE ProductID=?";
	private static final String GET_ALL_STMT = "SELECT ProductID, StatusID,SellListID,ProductPrice,Digital,Detail,Staus,Arrival,Expiration FROM Product ORDER BY Product";	
	
	public int insert(ProductBean productbean){
		// TODO Auto-generated method stub
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	        session.saveOrUpdate(productbean);      
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return 1;
		}catch (Exception e) {
			// TODO: handle exception
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return 0;
		}	
	    finally{
	        // TODO: handle finally clause
	        HibernateUtil.closeSessionFactory();
	    }   	
	}

	
	public int update(ProductBean productBean){
		// TODO Auto-generated method stub
	try{
		HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();

        session.saveOrUpdate(productBean);       
		
		HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
		return 1;
	}catch (Exception e) {
		// TODO: handle exception
		HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
		return 0;
	}	
    finally{
        // TODO: handle finally clause
        HibernateUtil.closeSessionFactory();
    }   
	}
	
	public int delete(String ProductID) throws SQLException {	
			try{
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
		        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	            
		        Query query=session.createQuery("delete from ProductBean where ProductID=?");
		        query.setParameter(0, ProductID);
		        int delete=query.executeUpdate();
		               
				HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
				return delete;	 
			}catch (Exception e) {
				// TODO: handle exception
				HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
				return 0;
			}	
		    finally{
		        // TODO: handle finally clause
		        HibernateUtil.closeSessionFactory();
		    }   
	}
	
	public ProductBean findByPrimaryKey(String id) throws SQLException {
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            
	        ProductBean bean = session.get(ProductBean.class,id);
	        	               
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return bean;	 
		}catch (Exception e) {
			// TODO: handle exception
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return null;
		}	
	    finally{
	        // TODO: handle finally clause
	        HibernateUtil.closeSessionFactory();
	    } 
	}
	
	
	public List<ProductBean> getAll(){	
		try {
			Context ctx = new InitialContext();
			DataSource dataSource;
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/JavaDB");
			Connection conn = dataSource.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(GET_ALL_STMT);
			
			List<ProductBean> list =null;
			while(rs.next()){
				ProductBean  pb = new ProductBean();
				
				pb.setProductID(rs.getString(1));
				pb.setStatusID(rs.getString(2));
				pb.setSellListID(rs.getString(3));
				pb.setProductPrice(rs.getInt(4));
				pb.setDigital(rs.getBytes(5));
				pb.setDetail(rs.getString(6));
				pb.setStaus(rs.getString(7));
				pb.setArrival(rs.getDate(8));
				pb.setExpiration(rs.getDate(9));
				
				list.add(pb);
			}
			return list;
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	public void closeconn() throws SQLException {
		// TODO Auto-generated method stub
		
	}
	public void IProductDAO() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	
	

}
