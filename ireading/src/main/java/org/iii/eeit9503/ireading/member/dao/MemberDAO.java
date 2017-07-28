package org.iii.eeit9503.ireading.member.dao;

import java.util.List;

import org.iii.eeit9503.ireading.member.bean.MemberBean;



public interface MemberDAO {
	public int insert(MemberBean bean);
	public int update(MemberBean bean);
	public int delete(String MemberID);
	public MemberBean findByID(String  MemberID);
	public List<MemberBean> getAll();
}
