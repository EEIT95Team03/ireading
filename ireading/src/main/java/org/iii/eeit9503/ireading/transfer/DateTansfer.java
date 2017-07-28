package org.iii.eeit9503.ireading.transfer;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateTansfer {

	public java.sql.Date Today(){
		new java.sql.Date(new java.util.Date().getTime());	
		return new java.sql.Date(new java.util.Date().getTime());				
	}
	
	
	public java.sql.Timestamp Now(){
		new java.sql.Date(new java.util.Date().getTime());	
		return new java.sql.Timestamp(new java.util.Date().getTime());				
	}
	
	public java.sql.Date getDate(int year,int month,int day){	
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			return new java.sql.Date(sdf.parse(year+"-"+month+"-"+day).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}				
	}
	
	public java.sql.Timestamp getTime(int year,int month,int day,int hr,int min,int sec){	
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return	new java.sql.Timestamp(sdf.parse(year+"-"+month+"-"+day+" "+hr+":"+min+":"+sec).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
}
