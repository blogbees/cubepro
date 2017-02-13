package com.cubepro.student.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.homework.HomeWork;
import com.cubepro.student.StudentHomeWork;

public class StudentHomeWorkForm extends CubeProActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */

	private StudentHomeWork studentHomeWorkDetail = new StudentHomeWork();

	private List<StudentHomeWork> studentHomeWorkList = new ArrayList<StudentHomeWork>();

	private List<ClassDetails> classDetails = new ArrayList<ClassDetails>();

	private List<HomeWork> homeWorkDetails = new ArrayList<HomeWork>();

	public StudentHomeWork getStudentHomeWorkDetail() {
		return studentHomeWorkDetail;
	}

	public void setStudentHomeWorkDetail(StudentHomeWork studentHomeWorkDetail) {
		this.studentHomeWorkDetail = studentHomeWorkDetail;
	}

	public List<StudentHomeWork> getStudentHomeWorkList() {
		return studentHomeWorkList;
	}

	public void setStudentHomeWorkList(List<StudentHomeWork> studentHomeWorkList) {
		this.studentHomeWorkList = studentHomeWorkList;
	}

	public List<ClassDetails> getClassDetails() {
		return classDetails;
	}

	public void setClassDetails(List<ClassDetails> classDetails) {
		this.classDetails = classDetails;
	}

	public List<HomeWork> getHomeWorkDetails() {
		return homeWorkDetails;
	}

	public void setHomeWorkDetails(List<HomeWork> homeWorkDetails) {
		this.homeWorkDetails = homeWorkDetails;
	}

}
