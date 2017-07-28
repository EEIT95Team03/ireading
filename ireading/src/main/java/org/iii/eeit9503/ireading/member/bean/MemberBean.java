package org.iii.eeit9503.ireading.member.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Member")
public class MemberBean implements Serializable{
	@Id
	private String MemberID;
	private String Account;
	private String Pwd;
	private String MName;
	private String NickName;
	private String Addr;
	private String Cell;
	private java.sql.Date Birthday;
	private java.sql.Date RegDate;
	private int Gender;
	private int Income;
	private byte[] Photo;
	
	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	public String getAccount() {
		return Account;
	}
	public void setAccount(String account) {
		Account = account;
	}
	public String getPwd() {
		return Pwd;
	}
	public void setPwd(String pwd) {
		Pwd = pwd;
	}
	public String getMName() {
		return MName;
	}
	public void setMName(String mName) {
		MName = mName;
	}
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		Addr = addr;
	}
	public String getCell() {
		return Cell;
	}
	public void setCell(String cell) {
		Cell = cell;
	}
	public java.sql.Date getBirthday() {
		return Birthday;
	}
	public void setBirthday(java.sql.Date birthday) {
		Birthday = birthday;
	}
	public java.sql.Date getRegDate() {
		return RegDate;
	}
	public void setRegDate(java.sql.Date regDate) {
		RegDate = regDate;
	}
	public int getGender() {
		return Gender;
	}
	public void setGender(int gender) {
		Gender = gender;
	}
	public int getIncome() {
		return Income;
	}
	public void setIncome(int income) {
		Income = income;
	}
	public byte[] getPhoto() {
		return Photo;
	}
	public void setPhoto(byte[] photo) {
		Photo = photo;
	}
		
}
