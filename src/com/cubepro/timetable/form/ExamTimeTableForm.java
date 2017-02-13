package com.cubepro.timetable.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.exam.ExamDetails;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.timetable.ExamTimeTable;

public class ExamTimeTableForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2583341779964002438L;
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private List<SubjectDetails> subjectList = new ArrayList<SubjectDetails>();
	
	private List<ExamDetails> examList = new ArrayList<ExamDetails>();
	
	private ExamTimeTable examTimeTable = new ExamTimeTable();
	
	private List<ExamTimeTable> examTimeTableList;
	
	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public List<SubjectDetails> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(List<SubjectDetails> subjectList) {
		this.subjectList = subjectList;
	}

	public List<ExamDetails> getExamList() {
		return examList;
	}

	public void setExamList(List<ExamDetails> examList) {
		this.examList = examList;
	}

	public ExamTimeTable getExamTimeTable() {
		return examTimeTable;
	}

	public void setExamTimeTable(ExamTimeTable examTimeTable) {
		this.examTimeTable = examTimeTable;
	}

	public List<ExamTimeTable> getExamTimeTableList() {
		return examTimeTableList;
	}

	public void setExamTimeTableList(List<ExamTimeTable> examTimeTableList) {
		this.examTimeTableList = examTimeTableList;
	}
	
}
