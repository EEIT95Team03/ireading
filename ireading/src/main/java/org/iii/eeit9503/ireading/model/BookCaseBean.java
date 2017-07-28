package org.iii.eeit9503.ireading.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="BookCase")
public class BookCaseBean implements Serializable {	
	private String MemberID;
	@Id
	private String BCID; //PK
	private String BCName;	
	private int CaseRank;
	private int Display;

	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	public String getBCID() {
		return BCID;
	}
	public void setBCID(String bCID) {
		BCID = bCID;
	}
	public String getBCName() {
		return BCName;
	}
	public void setBCName(String bCName) {
		BCName = bCName;
	}
	public int getCaseRank() {
		return CaseRank;
	}
	public void setCaseRank(int caseRank) {
		CaseRank = caseRank;
	}
	public int getDisplay() {
		return Display;
	}
	public void setDisplay(int display) {
		Display = display;
	}

	
}
