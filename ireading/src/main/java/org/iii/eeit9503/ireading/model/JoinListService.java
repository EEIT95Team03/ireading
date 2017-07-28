package org.iii.eeit9503.ireading.model;

import java.util.List;
import org.iii.eeit9503.ireading.model.JoinListBean;
import org.iii.eeit9503.ireading.dao.JoinListDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinListService {
	
@Autowired
private JoinListDAO joinlistDAO;

public int insert(JoinListBean joinlistbean){
	 
	if(joinlistDAO.check(joinlistbean)==0){
	return joinlistDAO.insert(joinlistbean);}
	else{return 0;}
}

public int update(JoinListBean joinlistbean){
	
	return joinlistDAO.update(joinlistbean);
}

public int delete(String EventID, String MemberID){
	return joinlistDAO.delete(EventID, MemberID);	
}

public List<JoinListBean> findByEventID(String EventID) {
	return joinlistDAO.findByEventID(EventID);	}


public List<JoinListBean> findByMemberID(String MemberID) {
	return joinlistDAO.findByMemberID(MemberID);	}


public int delete(JoinListBean joinlistbean){
	return joinlistDAO.delete(joinlistbean.getEventID(), joinlistbean.getMemberID());	
}

public List<JoinListBean> getAll(){
	
	return joinlistDAO.getAll();
}
	
}

