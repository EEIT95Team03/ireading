package org.iii.eeit9503.ireading.event.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Event")
public class EventBean {
	@Id
	private String EventID;
	private String EventName;
	private java.sql.Timestamp EventDate;
	private String Host;
	private String EventPhone;
	private String EventPlace;
	private byte[] EventImg;
	private java.sql.Timestamp Deadline;
	private String EventContent;
	private int Max;

	public String getEventID() {
		return EventID;
	}

	public void setEventID(String eventID) {
		EventID = eventID;
	}

	public String getEventName() {
		return EventName;
	}

	public void setEventName(String eventName) {
		EventName = eventName;
	}

	public String getHost() {
		return Host;
	}

	public void setHost(String host) {
		Host = host;
	}

	public String getEventPhone() {
		return EventPhone;
	}

	public void setEventPhone(String eventPhone) {
		EventPhone = eventPhone;
	}

	public String getEventPlace() {
		return EventPlace;
	}

	public void setEventPlace(String eventPlace) {
		EventPlace = eventPlace;
	}


	public byte[] getEventImg() {
		return EventImg;
	}

	public void setEventImg(byte[] eventImg) {
		EventImg = eventImg;
	}

	public String getEventContent() {
		return EventContent;
	}

	public void setEventContent(String eventContent) {
		EventContent = eventContent;
	}

	public int getMax() {
		return Max;
	}

	public void setMax(int max) {
		Max = max;
	}

	public java.sql.Timestamp getEventDate() {
		return EventDate;
	}

	public void setEventDate(java.sql.Timestamp eventDate) {
		EventDate = eventDate;
	}

	public java.sql.Timestamp getDeadline() {
		return Deadline;
	}

	public void setDeadline(java.sql.Timestamp deadline) {
		Deadline = deadline;
	}

}
