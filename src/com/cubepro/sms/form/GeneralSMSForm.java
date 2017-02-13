package com.cubepro.sms.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.staff.StaffDetails;
import com.cubepro.student.StudentDetails;

public class GeneralSMSForm extends CubeProActionForm{


	/**
	 * 
	 */
	private static final long serialVersionUID = -6634568457106574651L;

	private StudentDetails studentDetails = new StudentDetails();
	
	private StudentDetails searchStudentDetails = new StudentDetails();
	
	private StaffDetails searchStaffDetails = new StaffDetails();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private List<StudentDetails> studentList = new ArrayList<StudentDetails>();
	
	private List<StaffDetails> staffList = new ArrayList<StaffDetails>();
	
	private String smsToBeSent = "";

	public StudentDetails getStudentDetails() {
		return studentDetails;
	}

	public void setStudentDetails(StudentDetails studentDetails) {
		this.studentDetails = studentDetails;
	}

	public StudentDetails getSearchStudentDetails() {
		return searchStudentDetails;
	}

	public void setSearchStudentDetails(StudentDetails searchStudentDetails) {
		this.searchStudentDetails = searchStudentDetails;
	}

	public List<StudentDetails> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<StudentDetails> studentList) {
		this.studentList = studentList;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public String getSmsToBeSent() {
		return smsToBeSent;
	}

	public void setSmsToBeSent(String smsToBeSent) {
		this.smsToBeSent = smsToBeSent;
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

}
