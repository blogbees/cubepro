package com.cubepro.student.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.upload.FormFile;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.hostel.Room;
import com.cubepro.student.StudentDetails;
import com.cubepro.transport.RouteStop;

public class StudentDetailForm extends CubeProActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1544176435715651830L;

	private StudentDetails studentDetails = new StudentDetails();
	
	private StudentDetails searchStudentDetails = new StudentDetails();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private List<StudentDetails> studentList = new ArrayList<StudentDetails>();
	
	private List<RouteStop> routeStopList = new ArrayList<RouteStop>();
	
	private List<Room> roomList = new ArrayList<Room>();
	
	private FormFile studentPhoto;

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

	public FormFile getStudentPhoto() {
		return studentPhoto;
	}

	public void setStudentPhoto(FormFile studentPhoto) {
		this.studentPhoto = studentPhoto;
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
}
