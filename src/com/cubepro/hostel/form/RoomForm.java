package com.cubepro.hostel.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.hostel.BuildingInf;
import com.cubepro.hostel.Room;

public class RoomForm extends CubeProActionForm{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 988630202031010255L;

	private Room roomDetail = new Room();
	
	private List<Room> roomList = new ArrayList<Room>();
	
	private List<BuildingInf> buildingInfList = new ArrayList<BuildingInf>(); 

	public Room getRoomDetail() {
		return roomDetail;
	}

	public void setRoomDetail(Room roomDetail) {
		this.roomDetail = roomDetail;
	}

	public List<Room> getRoomList() {
		return roomList;
	}

	public void setRoomList(List<Room> roomList) {
		this.roomList = roomList;
	}

	public List<BuildingInf> getBuildingInfList() {
		return buildingInfList;
	}

	public void setBuildingInfList(List<BuildingInf> buildingInfList) {
		this.buildingInfList = buildingInfList;
	}
	

}
