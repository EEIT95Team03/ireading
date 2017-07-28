package org.iii.eeit9503.ireading.event.dao;

import java.util.List;

import org.iii.eeit9503.ireading.event.bean.EventBean;


public interface EventDAO{

public int insert(EventBean eventBean);
public int update(EventBean eventBean);
public int delete(String EventID);
public EventBean findByID(String EventID);
public List<EventBean> getAll();

	
}
