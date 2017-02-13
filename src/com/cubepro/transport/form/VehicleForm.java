package com.cubepro.transport.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.transport.Vehicle;

public class VehicleForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -842938717476167008L;

	private Vehicle vehicleDetail = new Vehicle();
	
	private List<Vehicle> vehicleList = new ArrayList<Vehicle>();

	public Vehicle getVehicleDetail() {
		return vehicleDetail;
	}

	public void setVehicleDetail(Vehicle vehicleDetail) {
		this.vehicleDetail = vehicleDetail;
	}

	public List<Vehicle> getVehicleList() {
		return vehicleList;
	}

	public void setVehicleList(List<Vehicle> vehicleList) {
		this.vehicleList = vehicleList;
	}
	

}
