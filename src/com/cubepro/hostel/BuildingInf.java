package com.cubepro.hostel;

import com.cubepro.staff.StaffDetails;

public class BuildingInf {
	private Integer buildingId = Integer.valueOf(0);
	private String name;
	private String type;
	private StaffDetails staffDetails = new StaffDetails();

	private String addr;
	private String phone1;
	private String phone2;
	private String mailId;
	private String noOfBlocks;
	private String noOfRooms;
	private String messAmt;
	private String maintCharge;
	private String repairAmt;

	public Integer getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public StaffDetails getStaffDetails() {
		return staffDetails;
	}

	public void setStaffDetails(StaffDetails staffDetails) {
		this.staffDetails = staffDetails;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getNoOfBlocks() {
		return noOfBlocks;
	}

	public void setNoOfBlocks(String noOfBlocks) {
		this.noOfBlocks = noOfBlocks;
	}

	public String getNoOfRooms() {
		return noOfRooms;
	}

	public void setNoOfRooms(String noOfRooms) {
		this.noOfRooms = noOfRooms;
	}

	public String getMessAmt() {
		return messAmt;
	}

	public void setMessAmt(String messAmt) {
		this.messAmt = messAmt;
	}

	public String getMaintCharge() {
		return maintCharge;
	}

	public void setMaintCharge(String maintCharge) {
		this.maintCharge = maintCharge;
	}

	public String getRepairAmt() {
		return repairAmt;
	}

	public void setRepairAmt(String repairAmt) {
		this.repairAmt = repairAmt;
	}
}
