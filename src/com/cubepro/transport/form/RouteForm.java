package com.cubepro.transport.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.transport.Route;
import com.cubepro.transport.Vehicle;

public class RouteForm extends CubeProActionForm{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 6751603757225662444L;

	private Route routeDetail = new Route();
	
	private List<Route> routeList = new ArrayList<Route>();
	
	private List<Vehicle> vehicleList = new ArrayList<Vehicle>();

	public Route getRouteDetail() {
		return routeDetail;
	}

	public void setRouteDetail(Route routeDetail) {
		this.routeDetail = routeDetail;
	}

	public List<Route> getRouteList() {
		return routeList;
	}

	public void setRouteList(List<Route> routeList) {
		this.routeList = routeList;
	}

	public List<Vehicle> getVehicleList() {
		return vehicleList;
	}

	public void setVehicleList(List<Vehicle> vehicleList) {
		this.vehicleList = vehicleList;
	}
	
	
}
