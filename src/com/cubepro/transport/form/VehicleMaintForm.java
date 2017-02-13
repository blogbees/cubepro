package com.cubepro.transport.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.transport.Vehicle;
import com.cubepro.transport.VehicleMaint;

public class VehicleMaintForm extends CubeProActionForm{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8367597828400639559L;

	private VehicleMaint vehicleMaintDetail = new VehicleMaint();
	
	private List<VehicleMaint> vehicleMaintList = new ArrayList<VehicleMaint>();
	
	private List<Vehicle> vehicleList = new ArrayList<Vehicle>();

	public VehicleMaint getVehicleMaintDetail() {
		return vehicleMaintDetail;
	}

	public void setVehicleMaintDetail(VehicleMaint vehicleMaintDetail) {
		this.vehicleMaintDetail = vehicleMaintDetail;
	}

	public List<VehicleMaint> getVehicleMaintList() {
		return vehicleMaintList;
	}

	public void setVehicleMaintList(List<VehicleMaint> vehicleMaintList) {
		this.vehicleMaintList = vehicleMaintList;
	}

	public List<Vehicle> getVehicleList() {
		return vehicleList;
	}

	public void setVehicleList(List<Vehicle> vehicleList) {
		this.vehicleList = vehicleList;
	}

	
}
