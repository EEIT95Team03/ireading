package org.iii.eeit9503.ireading.transfer;

import org.iii.eeit9503.ireading.member.dao.MemberDAO;
import org.iii.eeit9503.ireading.order.dao.OrderDAO;
import org.iii.eeit9503.ireading.product.dao.ProductDAO;
import org.iii.eeit9503.ireading.product.dao.SellListDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IDGgenerator {
@Autowired
	private OrderDAO orderDAO;
	//請自己實作DAO getLastID的方法
@Autowired
private MemberDAO memberDAO;
@Autowired
private ProductDAO productDAO;
@Autowired
private SellListDAO sellListDAO;
	
	public String getOrderID() {
		String ID=orderDAO.getLastID();
		String Date=null;
		if(ID==null){ID="O101010001";}
		else{
		Date=ID.substring(1,7);}
		String SID = "";
		if(!DateTansfer.getIDstring().equals(Date)){SID = "O"+DateTansfer.getIDstring()+"001";}
		else{ID =ID.substring(7);
		int y = Integer.parseInt(ID) + 1;
		String num="000"+ String.valueOf(y);
		SID="O"+DateTansfer.getIDstring()+num.substring(num.length()-3);
		
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
	
	public String getProductID(int i){
		String currentID = productDAO.getLastID();
		int temp = Integer.parseInt(currentID.substring(1));
		System.out.println(temp);
		String temp2 ="00000000" +(temp +1+i);
		String productID ="B" + temp2.substring(temp2.length()-9);
		
		return productID;
	}

	public String getSellListID(){
		String currentID = sellListDAO.getLastID();
		String datestr=currentID.substring(0,4);
		if(datestr.equals(DateTansfer.getIDstring().substring(0, 4)))
		{int temp = Integer.parseInt(currentID.substring(4));
		String num="0000"+(temp + 1);
		String SellListID = DateTansfer.getIDstring().substring(0, 4) + num.substring(num.length()-5);
		return SellListID;}
		else{
			String SellListID = DateTansfer.getIDstring().substring(0, 4) +"00001";	
			return SellListID;
		}	
	}
	

}
