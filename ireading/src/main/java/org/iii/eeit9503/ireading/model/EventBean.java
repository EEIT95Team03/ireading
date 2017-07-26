package org.iii.eeit9503.ireading.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "[ireadDB].[dbo].[Event]")
public class EventBean {
@Id
private String EvtID;
private String EvtName;
private java.sql.Date EvtDate;
private String Host;
private String EvtPhone;
private String EvtPlace;
private String EvtImg;
private java.sql.Date EvtDeadline;
private String EvtCont;
private int EvtMax;

public String getEvtID() {
	return EvtID;
}
public void setEvtID(String evtID) {
	EvtID = evtID;
}
public String getEvtName() {
	return EvtName;
}
public void setEvtName(String evtName) {
	EvtName = evtName;
}
public java.sql.Date getEvtDate() {
	return EvtDate;
}
public void setEvtDate(java.sql.Date evtDate) {
	EvtDate = evtDate;
}
public String getHost() {
	return Host;
}
public void setHost(String host) {
	Host = host;
}
public String getEvtPhone() {
	return EvtPhone;
}
public void setEvtPhone(String evtPhone) {
	EvtPhone = evtPhone;
}
public String getEvtPlace() {
	return EvtPlace;
}
public void setEvtPlace(String evtPlace) {
	EvtPlace = evtPlace;
}
public String getEvtImg() {
	return EvtImg;
}
public void setEvtImg(String evtImg) {
	EvtImg = evtImg;
}
public java.sql.Date getEvtDeadline() {
	return EvtDeadline;
}
public void setEvtDeadline(java.sql.Date evtDeadline) {
	EvtDeadline = evtDeadline;
}
public String getEvtCont() {
	return EvtCont;
}
public void setEvtCont(String evtCont) {
	EvtCont = evtCont;
}
public int getEvtMax() {
	return EvtMax;
}
public void setEvtMax(int evtMax) {
	EvtMax = evtMax;
}


}
