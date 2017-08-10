package org.iii.eeit9503.ireading.member.dao;

import java.util.List;

import org.iii.eeit9503.ireading.member.bean.MemberBean;



public interface MemberDAO {
	public MemberBean insert(MemberBean bean);
	public MemberBean update(MemberBean bean);
	public int delete(String MemberID);
	public MemberBean select(String  MemberID);
	public List<MemberBean> select();
	public MemberBean selectByAccount(String account);
	public String getLastID();
	
}
