package com.cubepro.alumini.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;

public class AluminiDetailForm extends CubeProActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6535902296819033695L;

	private Long fromClassId = Long.valueOf(0);

	private Long toClassId = Long.valueOf(0);
	
	private Long fromAdmClassId = Long.valueOf(0);

	private Long toAdmClassId = Long.valueOf(0);
	
	private String admissionNo = "";

	public Long getFromClassId() {
		return fromClassId;
	}

	public void setFromClassId(Long fromClassId) {
		this.fromClassId = fromClassId;
	}

	public Long getToClassId() {
		return toClassId;
	}

	public void setToClassId(Long toClassId) {
		this.toClassId = toClassId;
	}
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public String getAdmissionNo() {
		return admissionNo;
	}

	public void setAdmissionNo(String admissionNo) {
		this.admissionNo = admissionNo;
	}

	public Long getFromAdmClassId() {
		return fromAdmClassId;
	}

	public void setFromAdmClassId(Long fromAdmClassId) {
		this.fromAdmClassId = fromAdmClassId;
	}

	public Long getToAdmClassId() {
		return toAdmClassId;
	}

	public void setToAdmClassId(Long toAdmClassId) {
		this.toAdmClassId = toAdmClassId;
	}

}
