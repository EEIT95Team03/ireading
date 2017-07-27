package org.iii.eeit9503.ireading.model;

import java.util.List;

import org.iii.eeit9503.ireading.model.EventBean;
import org.iii.eeit9503.ireading.dao.EventDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventService {
	
	@Autowired
	private EventDAO eventDAO;
	
	public int insert(EventBean eventbean){
		 
		return eventDAO.insert(eventbean);
	}
	
	public int update(EventBean eventbean){
		return eventDAO.update(eventbean);
	}
	
	public int delete(String EvnetID){
		return eventDAO.delete(EvnetID);
	}
	
	public EventBean findByID(String EvnetID){
		return eventDAO.findByID(EvnetID);
	}
	
	public List<EventBean> getAll(){
		return eventDAO.getAll();
	}

}
