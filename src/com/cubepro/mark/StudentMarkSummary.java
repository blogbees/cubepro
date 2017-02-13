package com.cubepro.mark;

import com.cubepro.classes.ClassDetails;
import com.cubepro.exam.ExamDetails;
import com.cubepro.student.StudentDetails;

public class StudentMarkSummary {

	private Integer studentMarkSummaryId = Integer.valueOf(0);
	
	private ClassDetails classDetails = new ClassDetails();;

	private ExamDetails examDetails = new ExamDetails();

	private StudentDetails studentDetails = new StudentDetails();
	
	private String total;
	
	private String percentage;
	
	private String grade;

	public Integer getStudentMarkSummaryId() {
		return studentMarkSummaryId;
	}

	public void setStudentMarkSummaryId(Integer studentMarkSummaryId) {
		this.studentMarkSummaryId = studentMarkSummaryId;
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

	public StudentDetails getStudentDetails() {
		return studentDetails;
	}

	public void setStudentDetails(StudentDetails studentDetails) {
		this.studentDetails = studentDetails;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
}
