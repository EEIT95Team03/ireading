package org.iii.eeit9503.ireading.member.model;

import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private MemberDAO memberDao;
	public LoginService(MemberDAO memberDao){
		this.memberDao = memberDao;
	}
	
	public MemberBean login(String account, String password){
		MemberBean bean = memberDao.selectByAccount(account);
		if(bean!=null){
			if(password!=null && password.length()!=0){
				if(password.equals(bean.getPwd())){
					return bean;
				}
			}
		}
		return null;
	}
	
	public MemberBean Managerlogin(String account, String password){
		MemberBean bean = memberDao.selectByAccount(account);
		if(bean!=null){
			if(password!=null && password.length()!=0){
				if(password.equals(bean.getPwd())){
					if(bean.getAuth()==2){
					return bean;}
				}
			}
		}
		return null;
	}
	
	
	
	
}
