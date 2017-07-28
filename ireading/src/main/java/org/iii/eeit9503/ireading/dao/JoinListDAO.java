package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.iii.eeit9503.ireading.model.JoinListBean;

public interface JoinListDAO {
	public int insert(JoinListBean joinlistbean);
	public int update(JoinListBean joinlistbean);
	public int delete(String EventID,String MemberID);
	public List<JoinListBean> findByEventID(String EventID);
	public List<JoinListBean> findByMemberID(String MemberID);
	public List<JoinListBean> getAll();
	public int check(JoinListBean joinlistbean);

}
