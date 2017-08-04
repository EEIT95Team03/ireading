package org.iii.eeit9503.ireading.member.model;

import java.util.ArrayList;
import java.util.List;

import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public MemberBean insert(MemberBean bean){
		return memberDAO.insert(bean);
	}
	
	public MemberBean update(MemberBean bean){
		return memberDAO.update(bean);
	}
	
	public int delete(String MemberID){
		return memberDAO.delete(MemberID);
	}
	
	public List<MemberBean> select(MemberBean bean){
		List<MemberBean> list = null;
		if(bean!=null && bean.getMemberID().trim().length()!=0) {
			MemberBean temp = memberDAO.select(bean.getMemberID());
			if(temp!=null) {
				list = new ArrayList<MemberBean>();
				list.add(temp);
			}
		} else {
			list = memberDAO.select(); 
		}
		return list;
	}
	
	public String getLastID(){
		return memberDAO.getLastID();
	}

}
