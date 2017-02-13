package com.cubepro.exam.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.exam.ExamDetails;
import com.cubepro.exam.Term;

public class ExamDetailForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5956214068565722112L;
	
	private ExamDetails examDetail = new ExamDetails();
	
	private List<ExamDetails> examList = new ArrayList<ExamDetails>();
	
	private List<Term> terms = new ArrayList<Term>();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();

	public ExamDetails getExamDetail() {
		return examDetail;
	}

	public void setExamDetail(ExamDetails examDetail) {
		this.examDetail = examDetail;
	}

	public List<ExamDetails> getExamList() {
		return examList;
	}

	public void setExamList(List<ExamDetails> examList) {
		this.examList = examList;
	}

	public List<Term> getTerms() {
		return terms;
	}

	public void setTerms(List<Term> terms) {
		this.terms = terms;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

}
