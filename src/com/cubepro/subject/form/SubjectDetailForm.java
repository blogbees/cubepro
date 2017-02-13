package com.cubepro.subject.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.subject.Subject;
import com.cubepro.subject.SubjectDetails;

public class SubjectDetailForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5729505445821961693L;
	
	private SubjectDetails subjectDetail = new SubjectDetails();
	
	private List<SubjectDetails> subjectList = new ArrayList<SubjectDetails>();
	
	private List<Subject> subjects = new ArrayList<Subject>();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();

	public SubjectDetails getSubjectDetail() {
		return subjectDetail;
	}

	public void setSubjectDetail(SubjectDetails subjectDetail) {
		this.subjectDetail = subjectDetail;
	}

	public List<SubjectDetails> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(List<SubjectDetails> subjectList) {
		this.subjectList = subjectList;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public List<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	}
}
