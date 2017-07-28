package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.iii.eeit9503.ireading.model.OutputBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OutputService {
	
	@Autowired
	private OutputDAO outputDAO;
	
	public void insert(OutputBean bean){
		outputDAO.insert(bean);
	}
	
	public void update(OutputBean bean){
		outputDAO.update(bean);
	}
	
	public void delete(String MemberID, String ApplyTime){
		outputDAO.delete(MemberID, ApplyTime);
	}
	
	public OutputBean findByID(String MemberID, String ApplyTime){
		return outputDAO.findByID(MemberID, ApplyTime);
	}
	
	public List<OutputBean> getAll(){
		return outputDAO.getAll();
	}
}
