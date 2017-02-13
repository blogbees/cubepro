package com.cubepro.transport;

public class VehicleMaint {

	private Integer vehicleMaintId = Integer.valueOf(0);

	private Vehicle vehicle = new Vehicle();

	private String dos;

	private String descr;

	private String amount;

	public Integer getVehicleMaintId() {
		return vehicleMaintId;
	}

	public void setVehicleMaintId(Integer vehicleMaintId) {
		this.vehicleMaintId = vehicleMaintId;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public String getDos() {
		return dos;
	}

	public void setDos(String dos) {
		this.dos = dos;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

}
