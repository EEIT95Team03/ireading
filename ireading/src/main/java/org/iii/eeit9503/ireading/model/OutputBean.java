package org.iii.eeit9503.ireading.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Output")
public class OutputBean implements Serializable {
	@Id
	private String MemberID;
	@Id
	private Timestamp ApplyTime;
	private String BankAccount;
	private int Amount;
	private int TotalTransfer;
	
	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	
	public Timestamp getApplyTime() {
		return ApplyTime;
	}
	public void setApplyTime(Timestamp applyTime) {
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
