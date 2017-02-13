package com.cubepro.timetable.classes.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.staff.StaffDetails;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.timetable.TimeTableDetails;

public class ClassTimeTableForm extends CubeProActionForm{
	private static final int YEAR = 2009;

	/**
	 * 
	 */
	private static final long serialVersionUID = -2044925847570142867L;

	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private List<StaffDetails> staffList = new ArrayList<StaffDetails>();
	
	private List<SubjectDetails> subjectList = new ArrayList<SubjectDetails>();
	
	private List<TimeTableDetails> classTimeTableDetails = new ArrayList<TimeTableDetails>();
	
	private int classId;
	
	private int yearOfTimeTable = YEAR;

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public int getYearOfTimeTable() {
		return yearOfTimeTable;
	}

	public void setYearOfTimeTable(int yearOfTimeTable) {
		this.yearOfTimeTable = yearOfTimeTable;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public List<TimeTableDetails> getClassTimeTableDetails() {
		return classTimeTableDetails;
	}

	public void setClassTimeTableDetails(
			List<TimeTableDetails> classTimeTableDetails) {
		this.classTimeTableDetails = classTimeTableDetails;
	}

	public List<StaffDetails> getStaffList() {
		return staffList;
	}

	public void setStaffList(List<StaffDetails> staffList) {
		this.staffList = staffList;
	}

	public List<SubjectDetails> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(List<SubjectDetails> subjectList) {
		this.subjectList = subjectList;
	}
	
	public TimeTableDetails getClassTimeTableDetail(int index) {
		while (index >= this.classTimeTableDetails.size())
			this.classTimeTableDetails.add( new TimeTableDetails() );
		return (TimeTableDetails)classTimeTableDetails.get(index);
	}
}
