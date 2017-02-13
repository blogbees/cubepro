package com.cubepro.hostel.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.hostel.BuildingInf;
import com.cubepro.staff.StaffDetails;

public class BuildingInfForm extends CubeProActionForm{


	/**
	 * 
	 */
	private static final long serialVersionUID = -5673168118469245172L;

	private BuildingInf buildingInfDetail = new BuildingInf();
	
	private List<StaffDetails> staffDetails = new ArrayList<StaffDetails>();
	
	private List<BuildingInf> buildingInfList = new ArrayList<BuildingInf>();

	public BuildingInf getBuildingInfDetail() {
		return buildingInfDetail;
	}

	public void setBuildingInfDetail(BuildingInf buildingInfDetail) {
		this.buildingInfDetail = buildingInfDetail;
	}

	public List<BuildingInf> getBuildingInfList() {
		return buildingInfList;
	}

	public void setBuildingInfList(List<BuildingInf> buildingInfList) {
		this.buildingInfList = buildingInfList;
	}

	public List<StaffDetails> getStaffDetails() {
		return staffDetails;
	}

	public void setStaffDetails(List<StaffDetails> staffDetails) {
		this.staffDetails = staffDetails;
	}
	

}
