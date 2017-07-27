package org.iii.eeit9503.ireading.model;

import java.util.List;
import java.util.Set;

import org.iii.eeit9503.ireading.model.EventBean;

public interface JoinListDAO_interface {
	public void insert(JoinListVO joinListVO);
    public void update(JoinListVO joinListVO);
    public void delete(Integer EventID);
    public JoinListVO findByPrimaryKey(Integer EventID);
    public List<JoinListVO> getAll();
    //查詢某部門的員工(一對多)(回傳 Set)
    public Set<EventBean> getEventsByJoinList(Integer EventID); 

}
