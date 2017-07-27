package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.iii.eeit9503.ireading.model.OutputBean;

public interface OutputDAO {
	public void insert(OutputBean bean);
	public void update(OutputBean bean);
	public void delete(String MemberID, String ApplyTime);
	public OutputBean findByID(String  MemberID, String ApplyTime);
	public List<OutputBean> getAll();
}
