package com.cubepro.hostel;

public class Visitor {
 private Integer visitorId = Integer.valueOf(0);
 private String visitorName;
 private String relation;
 private String inTime;
 private String outTime;
 private String inDate;
 private String whotosee;
 private String seetype;
 private Room room = new Room();
public String getInDate() {
	return inDate;
}
public void setInDate(String inDate) {
	this.inDate = inDate;
}
public Integer getVisitorId() {
	return visitorId;
}
public void setVisitorId(Integer visitorId) {
	this.visitorId = visitorId;
}
public String getVisitorName() {
	return visitorName;
}
public void setVisitorName(String visitorName) {
	this.visitorName = visitorName;
}
public String getRelation() {
	return relation;
}
public void setRelation(String relation) {
	this.relation = relation;
}
public String getInTime() {
	return inTime;
}
public void setInTime(String inTime) {
	this.inTime = inTime;
}
public String getOutTime() {
	return outTime;
}
public void setOutTime(String outTime) {
	this.outTime = outTime;
}
public String getWhotosee() {
	return whotosee;
}
public void setWhotosee(String whotosee) {
	this.whotosee = whotosee;
}
public String getSeetype() {
	return seetype;
}
public void setSeetype(String seetype) {
	this.seetype = seetype;
}
public Room getRoom() {
	return room;
}
public void setRoom(Room room) {
	this.room = room;
}
}
