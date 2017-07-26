package org.iii.eeit9503.ireading.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.criteria.Order;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.OrderBean;

public class OrderDAO{
	
	public int insert(OrderBean orderbean){
		// TODO Auto-generated method stub
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();

	        session.saveOrUpdate(orderbean);      
			
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

	
	public int update(OrderBean orderBean){
		// TODO Auto-generated method stub
	try{
		HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();

        session.saveOrUpdate(orderBean);       
		
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

	
	public int delete(String id){
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            
	        Query query=session.createQuery("delete from OrderBean where OrderID=?");
	        query.setParameter(0, id);
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

	
	public OrderBean findByPK(String id){
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            
	        OrderBean bean=session.get(OrderBean.class,id);
	        	               
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
	
	public List<OrderBean> getAll(){
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            
	        Query query=session.createQuery("from OrderBean");
	        List<OrderBean> list =query.list();
	        	               
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return list;	 
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
	
	

}
