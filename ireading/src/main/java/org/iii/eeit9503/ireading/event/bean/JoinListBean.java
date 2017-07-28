package org.iii.eeit9503.ireading.event.bean;

import javax.persistence.Id;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="JoinList")
public class JoinListBean implements Serializable{
@Id
	private String EventID;
@Id
	private String MemberID;

public String getEventID() {
	return EventID;
}
public void setEventID(String eventID) {
	EventID = eventID;
}
public String getMemberID() {
	return MemberID;
}
public void setMemberID(String memberID) {
	MemberID = memberID;
}
	

}
