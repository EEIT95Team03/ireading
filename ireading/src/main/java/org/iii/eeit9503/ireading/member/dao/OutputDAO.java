package org.iii.eeit9503.ireading.member.dao;

import java.util.List;

import org.iii.eeit9503.ireading.member.bean.OutputBean;

public interface OutputDAO {
	public int insert(OutputBean bean);
	public int update(OutputBean bean);
	public int delete(String MemberID, String ApplyTime);
	public OutputBean findByID(String  MemberID, String ApplyTime);
	public List<OutputBean> getAll();
}
