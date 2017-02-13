package com.cubepro.sms.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.attendance.StudentAttendanceDetails;

public class FeesSMSForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8136371205778092832L;

	private StudentDetails studentDetails = new StudentDetails();
	
	private StudentDetails searchStudentDetails = new StudentDetails();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	//private List<StudentAttendanceDetails> studentAttendances = new ArrayList<StudentAttendanceDetails>();
	
	private List<StudentDetails> studentFeeDetails = new ArrayList<StudentDetails>();
	
	private String attendanceDateString = "";
	
	private String fromDate;
	
	private String toDate;
	
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


	public List<StudentDetails> getStudentFeeDetails()
	{
		return studentFeeDetails;
	}
	
	public void setStudentFeeDetails(List<StudentDetails> studentFeeDetails)
	{
		this.studentFeeDetails=studentFeeDetails;
	}
	public String getSmsToBeSent() {
		return smsToBeSent;
	}

	public void setSmsToBeSent(String smsToBeSent) {
		this.smsToBeSent = smsToBeSent;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

}
