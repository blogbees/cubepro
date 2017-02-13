package com.cubepro.subject.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.subject.Subject;

public class SubjectForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8311722884839897541L;

	private Subject subjectDetail = new Subject();
	
	private List<Subject> subjectList = new ArrayList<Subject>();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();

	public Subject getSubjectDetail() {
		return subjectDetail;
	}

	public void setSubjectDetail(Subject subjectDetail) {
		this.subjectDetail = subjectDetail;
	}

	public List<Subject> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(List<Subject> subjectList) {
		this.subjectList = subjectList;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	
}
