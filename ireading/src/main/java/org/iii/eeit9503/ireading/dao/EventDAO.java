package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.iii.eeit9503.ireading.misc.HibernateUtil;
import org.iii.eeit9503.ireading.model.EventBean;

public class EventDAO {
	
	public int insert(EventBean eventbean){
		
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();

	        session.saveOrUpdate(eventbean);      
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			return 1;
		}catch (Exception e) {
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			return 0;
		}	
	    finally{
	        
	        HibernateUtil.closeSessionFactory();
	    }   	
	}

	
	public int update(EventBean eventbean){
		// TODO Auto-generated method stub
	try{
		HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();

        session.saveOrUpdate(eventbean);       
		
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
            
	        Query query=session.createQuery("delete from EventBean where EvtID=?");
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

	
	public EventBean findByPK(String id){
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            
	        EventBean bean=session.get(EventBean.class,id);
	        	               
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
	
	public List<EventBean> getAll(){
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
	        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            
	        Query query=session.createQuery("from EventBean");
	        List<EventBean> list =query.list();
	        	               
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
