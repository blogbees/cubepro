package com.cubepro.transport.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.transport.Vehicle;
import com.cubepro.transport.VehicleFuel;

public class VehicleFuelForm extends CubeProActionForm{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -1349846178392123486L;

	private VehicleFuel vehicleFuelDetail = new VehicleFuel();
	
	private List<VehicleFuel> vehicleFuelList = new ArrayList<VehicleFuel>();
	
	private List<Vehicle> vehicleList = new ArrayList<Vehicle>();

	public VehicleFuel getVehicleFuelDetail() {
		return vehicleFuelDetail;
	}

	public void setVehicleFuelDetail(VehicleFuel vehicleFuelDetail) {
		this.vehicleFuelDetail = vehicleFuelDetail;
	}

	public List<VehicleFuel> getVehicleFuelList() {
		return vehicleFuelList;
	}

	public void setVehicleFuelList(List<VehicleFuel> vehicleFuelList) {
		this.vehicleFuelList = vehicleFuelList;
	}

	public List<Vehicle> getVehicleList() {
		return vehicleList;
	}

	public void setVehicleList(List<Vehicle> vehicleList) {
		this.vehicleList = vehicleList;
	}

}
