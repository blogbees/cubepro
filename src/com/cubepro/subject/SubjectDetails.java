package com.cubepro.subject;

import com.cubepro.classes.ClassDetails;

// Generated by MyEclipse Persistence Tools

/**
 * SubjectDetails generated by MyEclipse Persistence Tools
 */
public class SubjectDetails implements
		java.io.Serializable {


	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 9090970225574879156L;

	private Integer subjectId;

	private ClassDetails classDetails = new ClassDetails();

	private String subjectName;

	private Double maxMarks;
	
	private String passMarks;
	
	private String status;

	// Constructors

	/** default constructor */
	public SubjectDetails() {
	}

	/** full constructor */
	public SubjectDetails(Integer subjectId, ClassDetails classDetails,
			String subjectName, Double maxMarks) {
		this.subjectId = subjectId;
		this.classDetails = classDetails;
		this.subjectName = subjectName;
		this.maxMarks = maxMarks;
	}

	// Property accessors

	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public ClassDetails getClassDetails() {
		return this.classDetails;
	}

	public void setClassDetails(ClassDetails classDetails) {
		this.classDetails = classDetails;
	}

	public String getSubjectName() {
		return this.subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public Double getMaxMarks() {
		return this.maxMarks;
	}

	public void setMaxMarks(Double maxMarks) {
		this.maxMarks = maxMarks;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPassMarks() {
		return passMarks;
	}

	public void setPassMarks(String passMarks) {
		this.passMarks = passMarks;
	}


}