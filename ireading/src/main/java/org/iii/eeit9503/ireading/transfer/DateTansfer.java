package org.iii.eeit9503.ireading.transfer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import org.hibernate.internal.util.compare.CalendarComparator;

public class DateTansfer {

	public static java.sql.Date Today(){
		new java.sql.Date(new java.util.Date().getTime());	
		return new java.sql.Date(new java.util.Date().getTime());				
	}
	
	
	public static java.sql.Timestamp Now(){
		new java.sql.Date(new java.util.Date().getTime());	
		return new java.sql.Timestamp(new java.util.Date().getTime());				
	}
	
	public static java.sql.Date getDate(int year,int month,int day){	
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			return new java.sql.Date(sdf.parse(year+"-"+month+"-"+day).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}				
	}
	
	public static String getExDate(){	
		try {	
			Calendar cal=Calendar.getInstance(Locale.TAIWAN);
			cal.setTime(new java.util.Date());
			int y=cal.get(cal.YEAR);
			int m=cal.get(cal.MONTH)+1;
			int d=cal.get(cal.DATE)+3;
			String date=y+"-"+m+"-"+d+" 23:59";
			return date;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}				
	}
	
	public static java.sql.Date getDate(String date){	
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			return new java.sql.Date(sdf.parse(date).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}				
	}
	
	public static java.sql.Timestamp getTime(int year,int month,int day,int hr,int min,int sec){	
		try {                  
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return	new java.sql.Timestamp(sdf.parse(year+"-"+month+"-"+day+" "+hr+":"+min+":"+sec).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
	
	public static java.sql.Timestamp getTime(int year,int month,int day,int hr,int min){	
		try {                  
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return	new java.sql.Timestamp(sdf.parse(year+"-"+month+"-"+day+" "+hr+":"+min).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
	
	public static java.sql.Timestamp getTime(String time){	
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return	new java.sql.Timestamp(sdf.parse(time).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
	
	public static String getIDstring(){
	Calendar cal=Calendar.getInstance(Locale.TAIWAN);
	cal.setTime(new java.util.Date());
	int y=cal.get(cal.YEAR);
	int m=cal.get(cal.MONTH);
	int d=cal.get(cal.DATE);
	String Date=String.valueOf(y).substring(2)+String.valueOf((m+1)/10)+String.valueOf((m+1)%10)+String.valueOf(d/10)+String.valueOf(d%10);
		return Date;		
	}
}
