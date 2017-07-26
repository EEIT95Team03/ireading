package org.iii.eeit9503.ireading.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="[ireadDB].[dbo].[BookCase]")
public class BookCaseBean {	
	@Id
	private String MemberID;
	private String BCID; //PK
	private String BCName;
	private boolean CaseRank;
	private boolean Display;

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
	public boolean getCaseRank() {
		return CaseRank;
	}
	public void setCaseRank(boolean caseRank) {
		CaseRank = caseRank;
	}
	public boolean getDisplay() {
		return Display;
	}
	public void setDisplay(boolean display) {
		Display = display;
	}
	
}
