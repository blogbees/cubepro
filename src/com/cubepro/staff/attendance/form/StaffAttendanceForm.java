package com.cubepro.staff.attendance.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.attendance.StaffAttendanceDetails;

public class StaffAttendanceForm extends CubeProActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3547283403335453612L;

	private StaffDetails staffDetails = new StaffDetails();
	
	private StaffDetails searchStaffDetails = new StaffDetails();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private List<StaffAttendanceDetails> staffAttendances = new ArrayList<StaffAttendanceDetails>();
	
	private String attendanceDateString = "";

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


	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public String getAttendanceDateString() {
		return attendanceDateString;
	}

	public void setAttendanceDateString(String attendanceDateString) {
		this.attendanceDateString = attendanceDateString;
	}


	/**
	 * Method to get the indexed element values of 'minorMembers' list. 
	 * 
	 * @param index
	 * @return
	 */
	public StaffAttendanceDetails getStaffAttendance(int index) {
		
		if(index >= staffAttendances.size()) {
			for(int count =0; index > (staffAttendances.size() -1); count++) {
				staffAttendances.add(new StaffAttendanceDetails());
			}
		}
	
		return staffAttendances.get(index);
	}

	public List<StaffAttendanceDetails> getStaffAttendances() {
		return staffAttendances;
	}

	public void setStaffAttendances(
			List<StaffAttendanceDetails> staffAttendances) {
		this.staffAttendances = staffAttendances;
	}
}
