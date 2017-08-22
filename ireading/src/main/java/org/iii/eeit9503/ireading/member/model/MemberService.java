package org.iii.eeit9503.ireading.member.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private MemberDAO memberDAO;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public MemberBean insert(MemberBean bean) {
		return memberDAO.insert(bean);
	}

	public MemberBean update(MemberBean bean) {
		return memberDAO.update(bean);
	}

	public int delete(String MemberID) {
		return memberDAO.delete(MemberID);
	}

	public List<MemberBean> select(MemberBean bean) {
		List<MemberBean> list = null;
		if (bean != null && bean.getMemberID().trim().length() != 0) {
			MemberBean temp = memberDAO.select(bean.getMemberID());
			if (temp != null) {
				list = new ArrayList<MemberBean>();
				list.add(temp);
			}
		} else {
			list = memberDAO.selectPaging();
		}
		return list;
	}

	public MemberBean select(String MemberID) {
		return memberDAO.select(MemberID);
	}

	public MemberBean selectByAccount(String account) {
		return memberDAO.selectByAccount(account);
	}

	public String getLastID() {
		return memberDAO.getLastID();
	}
	
	public Object getPhoto(String MemberID){
		try {
			   Session session = this.getSession();

			   Query query = session.createSQLQuery("select Cover from Member where MemberID=:MemberID");
			   query.setParameter("MemberID", MemberID);
			   List<Object> list= query.list();
            
			   return list.get(0);
			  } catch (Exception e) {

			   return null;
			  }
	}

}
