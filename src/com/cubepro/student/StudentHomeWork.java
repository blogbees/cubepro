package com.cubepro.student;

import com.cubepro.classes.ClassDetails;
import com.cubepro.homework.HomeWork;

public class StudentHomeWork {
	private Integer studentHomeWorkId = Integer.valueOf(0);
	private HomeWork homework = new HomeWork();
	private StudentDetails studentDetail = null;
	private String dateOfAssignment;
	private String dateToComplete;
	private ClassDetails classDetail = new ClassDetails();
	private String generalComments;
	private String admissionNo;

	public Integer getStudentHomeWorkId() {
		return studentHomeWorkId;
	}

	public void setStudentHomeWorkId(Integer studentHomeWorkId) {
		this.studentHomeWorkId = studentHomeWorkId;
	}

	public HomeWork getHomework() {
		return homework;
	}

	public void setHomework(HomeWork homework) {
		this.homework = homework;
	}

	public StudentDetails getStudentDetail() {
		return studentDetail;
	}

	public void setStudentDetail(StudentDetails studentDetail) {
		this.studentDetail = studentDetail;
	}

	public String getDateOfAssignment() {
		return dateOfAssignment;
	}

	public void setDateOfAssignment(String dateOfAssignment) {
		this.dateOfAssignment = dateOfAssignment;
	}

	public ClassDetails getClassDetail() {
		return classDetail;
	}

	public void setClassDetail(ClassDetails classDetail) {
		this.classDetail = classDetail;
	}

	public String getGeneralComments() {
		return generalComments;
	}

	public void setGeneralComments(String generalComments) {
		this.generalComments = generalComments;
	}

	public String getDateToComplete() {
		return dateToComplete;
	}

	public void setDateToComplete(String dateToComplete) {
		this.dateToComplete = dateToComplete;
	}

	public String getAdmissionNo() {
		return admissionNo;
	}

	public void setAdmissionNo(String admissionNo) {
		this.admissionNo = admissionNo;
	}
}
