package org.iii.eeit9503.ireading.dao;

public class EmpVO {
	private String evtid;
	private String evtname;
	private java.sql.Date evtdate;
	private String host;
	private String evtphone;
	private String evtplace;
	private String evtimg;
	private java.sql.Date evtdeadline;
	private String evtcont;
	private int evtmax;
	
	public String getEvtid() {
		return evtid;
	}
	public void setEvtid(String evtid) {
		this.evtid = evtid;
	}
	public String getEvtname() {
		return evtname;
	}
	public void setEvtname(String evtname) {
		this.evtname = evtname;
	}
	public java.sql.Date getEvtdate() {
		return evtdate;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public void setEvtdate(java.sql.Date evtdate) {
		this.evtdate = evtdate;
	}
	public String getEvtphone() {
		return evtphone;
	}
	public void setEvtphone(String evtphone) {
		this.evtphone = evtphone;
	}
	public String getEvtplace() {
		return evtplace;
	}
	public void setEvtplace(String evtplace) {
		this.evtplace = evtplace;
	}
	public String getEvtimg() {
		return evtimg;
	}
	public void setEvtimg(String evtimg) {
		this.evtimg = evtimg;
	}
	public java.sql.Date getEvtdeadline() {
		return evtdeadline;
	}
	public void setEvtdeadline(java.sql.Date evtdeadline) {
		this.evtdeadline = evtdeadline;
	}
	public String getEvtcont() {
		return evtcont;
	}
	public void setEvtcont(String evtcont) {
		this.evtcont = evtcont;
	}
	public int getEvtmax() {
		return evtmax;
	}
	public void setEvtmax(int evtmax) {
		this.evtmax = evtmax;
	}
	
}
