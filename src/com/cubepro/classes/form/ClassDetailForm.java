package com.cubepro.classes.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;

public class ClassDetailForm extends CubeProActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4253989399728046217L;

	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private ClassDetails classDetail = new ClassDetails();

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public ClassDetails getClassDetail() {
		return classDetail;
	}

	public void setClassDetail(ClassDetails classDetail) {
		this.classDetail = classDetail;
	}
	
}
