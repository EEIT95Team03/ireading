package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.iii.eeit9503.ireading.model.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public void insert(MemberBean bean){
		memberDAO.insert(bean);
	}
	
	public void update(MemberBean bean){
		memberDAO.update(bean);
	}
	
	public void delete(String MemberID){
		memberDAO.delete(MemberID);
	}
	
	public MemberBean findByID(String MemberID){
		return memberDAO.findByID(MemberID);
	}
	
	public List<MemberBean> getAll(){
		return memberDAO.getAll();
	}

}
