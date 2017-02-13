package com.cubepro.transport;

public class RouteStop {

	private Integer routeStopId = Integer.valueOf(0);

	private Route route = new Route();

	private Stop stop = new Stop();

	private String stopFees;

	private String stopOrder;

	public Integer getRouteStopId() {
		return routeStopId;
	}

	public void setRouteStopId(Integer routeStopId) {
		this.routeStopId = routeStopId;
	}

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public Stop getStop() {
		return stop;
	}

	public void setStop(Stop stop) {
		this.stop = stop;
	}

	public String getStopFees() {
		return stopFees;
	}

	public void setStopFees(String stopFees) {
		this.stopFees = stopFees;
	}

	public String getStopOrder() {
		return stopOrder;
	}

	public void setStopOrder(String stopOrder) {
		this.stopOrder = stopOrder;
	}

}
