package com.cubepro.hostel;

public class Room {
	private Integer roomId = Integer.valueOf(0);
	private BuildingInf buildingInf = new BuildingInf();
	private String roomNo;
	private String roomExtn;
	private String strength;
	private String assets;
	private String bathroomAtt;
	private String roomCost;

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public BuildingInf getBuildingInf() {
		return buildingInf;
	}

	public void setBuildingInf(BuildingInf buildingInf) {
		this.buildingInf = buildingInf;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomExtn() {
		return roomExtn;
	}

	public void setRoomExtn(String roomExtn) {
		this.roomExtn = roomExtn;
	}

	public String getStrength() {
		return strength;
	}

	public void setStrength(String strength) {
		this.strength = strength;
	}

	public String getAssets() {
		return assets;
	}

	public void setAssets(String assets) {
		this.assets = assets;
	}

	public String getBathroomAtt() {
		return bathroomAtt;
	}

	public void setBathroomAtt(String bathroomAtt) {
		this.bathroomAtt = bathroomAtt;
	}

	public String getRoomCost() {
		return roomCost;
	}

	public void setRoomCost(String roomCost) {
		this.roomCost = roomCost;
	}
}
