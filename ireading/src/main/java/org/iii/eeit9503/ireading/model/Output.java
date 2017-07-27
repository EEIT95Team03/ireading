package org.iii.eeit9503.ireading.model;

import java.io.Serializable;

public class Output implements Serializable {
	private String MemberID;
	private java.sql.Date ApplyTime;
	private String BankAccount;
	private int Amount;
	private int TotalTransfer;
	
	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	public java.sql.Date getApplyTime() {
		return ApplyTime;
	}
	public void setApplyTime(java.sql.Date applyTime) {
		ApplyTime = applyTime;
	}
	public String getBankAccount() {
		return BankAccount;
	}
	public void setBankAccount(String bankAccount) {
		BankAccount = bankAccount;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public int getTotalTransfer() {
		return TotalTransfer;
	}
	public void setTotalTransfer(int totalTransfer) {
		TotalTransfer = totalTransfer;
	}
}
