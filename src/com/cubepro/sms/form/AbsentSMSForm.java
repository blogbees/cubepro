package com.cubepro.sms.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.attendance.StudentAttendanceDetails;

public class AbsentSMSForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8136371205778092832L;

	private StudentDetails studentDetails = new StudentDetails();
	
	private StudentDetails searchStudentDetails = new StudentDetails();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private List<StudentAttendanceDetails> studentAttendances = new ArrayList<StudentAttendanceDetails>();
	
	private String attendanceDateString = "";
	
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


	/**
	 * Method to get the indexed element values of 'minorMembers' list. 
	 * 
	 * @param index
	 * @return
	 */
	public StudentAttendanceDetails getStudentAttendance(int index) {
		
		if(index >= studentAttendances.size()) {
			for(int count =0; index > (studentAttendances.size() -1); count++) {
				studentAttendances.add(new StudentAttendanceDetails());
			}
		}
	
		return studentAttendances.get(index);
	}

	public List<StudentAttendanceDetails> getStudentAttendances() {
		return studentAttendances;
	}

	public void setStudentAttendances(
			List<StudentAttendanceDetails> studentAttendances) {
		this.studentAttendances = studentAttendances;
	}

	public String getSmsToBeSent() {
		return smsToBeSent;
	}

	public void setSmsToBeSent(String smsToBeSent) {
		this.smsToBeSent = smsToBeSent;
	}

}
