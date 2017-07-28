package org.iii.eeit9503.ireading.member.model;

import java.util.List;

import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public int insert(MemberBean bean){
		return memberDAO.insert(bean);
	}
	
	public int update(MemberBean bean){
		return memberDAO.update(bean);
	}
	
	public int delete(String MemberID){
		return memberDAO.delete(MemberID);
	}
	
	public MemberBean findByID(String MemberID){
		return memberDAO.findByID(MemberID);
	}
	
	public List<MemberBean> getAll(){
		return memberDAO.getAll();
	}

}
