package org.iii.eeit9503.ireading.member.model;

import java.util.List;

import org.iii.eeit9503.ireading.member.bean.OutputBean;
import org.iii.eeit9503.ireading.member.dao.OutputDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OutputService {
	
	@Autowired
	private OutputDAO outputDAO;
	
	public int insert(OutputBean bean){
		return outputDAO.insert(bean);
	}
	
	public int update(OutputBean bean){
		return outputDAO.update(bean);
	}
	
	public int delete(String MemberID, String ApplyTime){
		return outputDAO.delete(MemberID, ApplyTime);
	}
	
	public OutputBean findByID(String MemberID, String ApplyTime){
		return outputDAO.findByID(MemberID, ApplyTime);
	}
	
	public List<OutputBean> getAll(){
		return outputDAO.getAll();
	}
}
