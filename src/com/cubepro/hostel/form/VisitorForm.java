package com.cubepro.hostel.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.hostel.Room;
import com.cubepro.hostel.Visitor;

public class VisitorForm extends CubeProActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2971812313606475754L;
	private List<Room> roomList = new ArrayList<Room>();
	private List<Visitor> visitorList = new ArrayList<Visitor>();
	private Visitor visitorDetail = new Visitor();

	public List<Room> getRoomList() {
		return roomList;
	}

	public void setRoomList(List<Room> roomList) {
		this.roomList = roomList;
	}

	public List<Visitor> getVisitorList() {
		return visitorList;
	}

	public void setVisitorList(List<Visitor> visitorList) {
		this.visitorList = visitorList;
	}

	public Visitor getVisitorDetail() {
		return visitorDetail;
	}

	public void setVisitorDetail(Visitor visitorDetail) {
		this.visitorDetail = visitorDetail;
	}
}
