package com.cubepro.timetable;

import java.util.Date;

import com.cubepro.classes.ClassDetails;
import com.cubepro.exam.ExamDetails;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.util.DateUtils;

public class ExamTimeTable {
	
	private Integer examTimeTableId = Integer.valueOf(0);
	
	private ClassDetails classDetails = new ClassDetails();
	
	private ExamDetails examDetails = new ExamDetails();
	
	private SubjectDetails subjectDetails = new SubjectDetails();
	
	private Date examDate;
	
	private String examDateString;
	
	private String timeFrom;
	
	private String timeTo;
	
	private Date createDate;

	private Integer createUserId;

	private Date changeDate;

	private Integer changeUserId;

	public Integer getExamTimeTableId() {
		return examTimeTableId;
	}

	public void setExamTimeTableId(Integer examTimeTableId) {
		this.examTimeTableId = examTimeTableId;
	}

	public ClassDetails getClassDetails() {
		return classDetails;
	}

	public void setClassDetails(ClassDetails classDetails) {
		this.classDetails = classDetails;
	}

	public ExamDetails getExamDetails() {
		return examDetails;
	}

	public void setExamDetails(ExamDetails examDetails) {
		this.examDetails = examDetails;
	}

	public SubjectDetails getSubjectDetails() {
		return subjectDetails;
	}

	public void setSubjectDetails(SubjectDetails subjectDetails) {
		this.subjectDetails = subjectDetails;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
		if(examDate!=null){
			this.examDateString = DateUtils.getDateAsString(examDate);
		}

	}

	public String getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(String timeFrom) {
		this.timeFrom = timeFrom;
	}

	public String getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(String timeTo) {
		this.timeTo = timeTo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	public Integer getChangeUserId() {
		return changeUserId;
	}

	public void setChangeUserId(Integer changeUserId) {
		this.changeUserId = changeUserId;
	}

	public String getExamDateString() {
		return examDateString;
	}

	public void setExamDateString(String examDateString) {
		this.examDateString = examDateString;
		if(examDateString!=null && examDateString.trim().length() > 0){
			this.examDate = DateUtils.getDate(examDateString);
		}
	}

	
}
