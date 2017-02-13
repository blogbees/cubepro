package com.cubepro.transport.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.transport.Route;
import com.cubepro.transport.RouteStop;
import com.cubepro.transport.Stop;

public class RouteStopForm extends CubeProActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6736792460895858143L;

	private RouteStop routeStopDetail = new RouteStop();
	
	private List<RouteStop> routeStopList = new ArrayList<RouteStop>();
	
	private List<Route> routeList = new ArrayList<Route>();
	
	private List<Stop> stopList = new ArrayList<Stop>();

	public RouteStop getRouteStopDetail() {
		return routeStopDetail;
	}

	public void setRouteStopDetail(RouteStop routeStopDetail) {
		this.routeStopDetail = routeStopDetail;
	}

	public List<RouteStop> getRouteStopList() {
		return routeStopList;
	}

	public void setRouteStopList(List<RouteStop> routeStopList) {
		this.routeStopList = routeStopList;
	}

	public List<Route> getRouteList() {
		return routeList;
	}

	public void setRouteList(List<Route> routeList) {
		this.routeList = routeList;
	}

	public List<Stop> getStopList() {
		return stopList;
	}

	public void setStopList(List<Stop> stopList) {
		this.stopList = stopList;
	}
	
}
