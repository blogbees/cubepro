package com.cubepro.transport.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.transport.Stop;

public class StopForm extends CubeProActionForm{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 674911086403491867L;

	private Stop stopDetail = new Stop();
	
	private List<Stop> stopList = new ArrayList<Stop>();

	public Stop getStopDetail() {
		return stopDetail;
	}

	public void setStopDetail(Stop stopDetail) {
		this.stopDetail = stopDetail;
	}

	public List<Stop> getStopList() {
		return stopList;
	}

	public void setStopList(List<Stop> stopList) {
		this.stopList = stopList;
	}
	
	}
