package com.cubepro.exam.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.exam.Term;

public class TermForm extends CubeProActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6736792460895858143L;

	private Term termDetail = new Term();
	
	private List<Term> termList = new ArrayList<Term>();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();

	public Term getTermDetail() {
		return termDetail;
	}

	public void setTermDetail(Term termDetail) {
		this.termDetail = termDetail;
	}

	public List<Term> getTermList() {
		return termList;
	}

	public void setTermList(List<Term> termList) {
		this.termList = termList;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

}
