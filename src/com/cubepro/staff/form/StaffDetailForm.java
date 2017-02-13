package com.cubepro.staff.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.upload.FormFile;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.hostel.Room;
import com.cubepro.staff.StaffDetails;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.transport.RouteStop;

public class StaffDetailForm extends CubeProActionForm {


	/**
	 * 
	 */
	private static final long serialVersionUID = -7813765451787739505L;

	private StaffDetails staffDetails = new StaffDetails();
	
	private StaffDetails searchStaffDetails = new StaffDetails();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private List<SubjectDetails> subjectList = new ArrayList<SubjectDetails>();
	
	private List<StaffDetails> staffList = new ArrayList<StaffDetails>();
	
	private List<RouteStop> routeStopList = new ArrayList<RouteStop>();
	
	private List<Room> roomList = new ArrayList<Room>();
	
	private FormFile staffPhoto;

	public StaffDetails getStaffDetails() {
		return staffDetails;
	}

	public void setStaffDetails(StaffDetails staffDetails) {
		this.staffDetails = staffDetails;
	}

	public StaffDetails getSearchStaffDetails() {
		return searchStaffDetails;
	}

	public void setSearchStaffDetails(StaffDetails searchStaffDetails) {
		this.searchStaffDetails = searchStaffDetails;
	}

	public List<StaffDetails> getStaffList() {
		return staffList;
	}

	public void setStaffList(List<StaffDetails> staffList) {
		this.staffList = staffList;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public List<SubjectDetails> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(List<SubjectDetails> subjectList) {
		this.subjectList = subjectList;
	}

	public List<RouteStop> getRouteStopList() {
		return routeStopList;
	}

	public void setRouteStopList(List<RouteStop> routeStopList) {
		this.routeStopList = routeStopList;
	}

	public List<Room> getRoomList() {
		return roomList;
	}

	public void setRoomList(List<Room> roomList) {
		this.roomList = roomList;
	}

	public FormFile getStaffPhoto() {
		return staffPhoto;
	}

	public void setStaffPhoto(FormFile staffPhoto) {
		this.staffPhoto = staffPhoto;
	}
}
