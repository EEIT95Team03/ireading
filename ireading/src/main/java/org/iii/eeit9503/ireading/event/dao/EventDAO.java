package org.iii.eeit9503.ireading.event.dao;

import java.util.List;

import org.iii.eeit9503.ireading.event.bean.EventBean;

public interface EventDAO{

public abstract EventBean select(String EventID);

public abstract List<EventBean> select();

public abstract int insert(EventBean eventBean);

public abstract EventBean update(EventBean eventBean);

public abstract int delete(String EventID);

public abstract EventBean findByEventID(String EventID);

public abstract String getLastID();

public List<EventBean> EventWall(int index,int count);
}
