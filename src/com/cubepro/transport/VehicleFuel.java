package com.cubepro.transport;

public class VehicleFuel {

	private Integer vehicleFuelId = Integer.valueOf(0);

	private Vehicle vehicle = new Vehicle();

	private String dof;

	private String litres;

	private String totalKms;

	private String amount;

	public Integer getVehicleFuelId() {
		return vehicleFuelId;
	}

	public void setVehicleFuelId(Integer vehicleFuelId) {
		this.vehicleFuelId = vehicleFuelId;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public String getDof() {
		return dof;
	}

	public void setDof(String dof) {
		this.dof = dof;
	}

	public String getLitres() {
		return litres;
	}

	public void setLitres(String litres) {
		this.litres = litres;
	}

	public String getTotalKms() {
		return totalKms;
	}

	public void setTotalKms(String totalKms) {
		this.totalKms = totalKms;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
}
