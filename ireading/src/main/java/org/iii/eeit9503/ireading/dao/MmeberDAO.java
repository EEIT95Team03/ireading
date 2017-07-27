package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.iii.eeit9503.ireading.model.MemberBean;

public interface MmeberDAO {
	
	public void insert(MemberBean bean);
	public void update(MemberBean bean);
	public void delete(String MemberID);
	public MemberBean findByID(String  MemberID);
	public List<MemberBean> getAll();
}
