package com.cubepro.timetable.classes;

import com.cubepro.classes.ClassDetails;

public class ClassTimeTable {

	private int classTimeTableId;
	
	private ClassDetails classDetail;

	private int day;

	private String subjectName1;

	private String subjectName2;

	private String subjectName3;

	private String subjectName4;

	private String subjectName5;

	private String subjectName6;

	private String subjectName7;

	private String subjectName8;

	private String createDate;

	public ClassDetails getClassDetail() {
		return classDetail;
	}

	public void setClassDetail(ClassDetails classDetail) {
		this.classDetail = classDetail;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getDay() {
		return day;
	}

	public String getSubjectName1() {
		return subjectName1;
	}

	public void setSubjectName1(String subjectName1) {
		this.subjectName1 = subjectName1;
	}

	public String getSubjectName2() {
		return subjectName2;
	}

	public void setSubjectName2(String subjectName2) {
		this.subjectName2 = subjectName2;
	}

	public String getSubjectName3() {
		return subjectName3;
	}

	public void setSubjectName3(String subjectName3) {
		this.subjectName3 = subjectName3;
	}

	public String getSubjectName4() {
		return subjectName4;
	}

	public void setSubjectName4(String subjectName4) {
		this.subjectName4 = subjectName4;
	}

	public String getSubjectName5() {
		return subjectName5;
	}

	public void setSubjectName5(String subjectName5) {
		this.subjectName5 = subjectName5;
	}

	public String getSubjectName6() {
		return subjectName6;
	}

	public void setSubjectName6(String subjectName6) {
		this.subjectName6 = subjectName6;
	}

	public String getSubjectName7() {
		return subjectName7;
	}

	public void setSubjectName7(String subjectName7) {
		this.subjectName7 = subjectName7;
	}

	public String getSubjectName8() {
		return subjectName8;
	}

	public void setSubjectName8(String subjectName8) {
		this.subjectName8 = subjectName8;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getClassTimeTableId() {
		return classTimeTableId;
	}

	public void setClassTimeTableId(int classTimeTableId) {
		this.classTimeTableId = classTimeTableId;
	}

}
