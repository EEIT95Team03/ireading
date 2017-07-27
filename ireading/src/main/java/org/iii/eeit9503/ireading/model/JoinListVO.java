package org.iii.eeit9503.ireading.model;

import java.util.HashSet;
import java.util.Set;

public class JoinListVO implements java.io.Serializable{
	
	private String EventID;
	private String MemberID;
	
	private Set<EventBean> events = new HashSet<EventBean>();
	private Set<MemberBean> members = new HashSet<MemberBean>();
	
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
	public Set<EventBean> getEvents() {
		return events;
	}
	public void setEvents(Set<EventBean> events) {
		this.events = events;
	}
	public Set<MemberBean> getMembers() {
		return members;
	}
	public void setMembers(Set<MemberBean> members) {
		this.members = members;
	}
	
	
}
