package org.iii.eeit9503.ireading.transfer;

import org.iii.eeit9503.ireading.member.dao.MemberDAO;
import org.iii.eeit9503.ireading.order.dao.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IDGgenerator {
@Autowired
	private OrderDAO orderDAO;
	//請自己實作DAO getLastID的方法
@Autowired
private MemberDAO memberDAO;
	
	public String getOrderID() {
		String ID=orderDAO.getLastID();
		String Date=ID.substring(1,7);
		String SID = "O";
		if(!DateTansfer.getIDstring().equals(Date)){SID = SID+DateTansfer.getIDstring()+"001";}
		else{ID =ID.substring(7);
		int y = Integer.parseInt(ID) + 1;
		if (y < 10) {
			SID = SID+DateTansfer.getIDstring()+"00" + y;
		}
		if (y>= 10 && y< 100) {
			SID = SID+ DateTansfer.getIDstring()+"0" + y;
		}
		if (y >= 100) {
			SID = SID+DateTansfer.getIDstring()+ y;
		}	
		}
		return SID;
	}
	
	public String getMemberID(){
		String currentID = memberDAO.getLastID();
		int temp = Integer.parseInt(currentID);
		System.out.println(temp);
		String temp2 = "000000" + (temp+1);
		
		String memberID= "M" + DateTansfer.getIDstring().substring(0, 2) + temp2.substring(temp2.length()-7);
		
		
		return memberID;
	}
	

}
