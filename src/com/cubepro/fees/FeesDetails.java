package com.cubepro.fees;

// Generated by MyEclipse Persistence Tools

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.cubepro.classes.ClassDetails;

/**
 * FeesDetails generated by MyEclipse Persistence Tools
 */
public class FeesDetails implements
		java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 3540509989053890356L;

	private Integer feesId;

	private ClassDetails classDetails;

	private Double feesAmount;
	
	private String feesType;

	private Date createDate;

	private Integer createUserId;

	private Date changeDate;

	private Integer changeUserId;
	
	private String subType;
	
	private String paidBy;
	
	private String payBy;
	
	private String cheqNo;
	
	private String fine;
	
	private String transportFee;
	
	private String hostelFee;
	
	private String studentType;
	
	private String scholarAmt;

	private Set invoiceDetailses = new HashSet(0);

	// Constructors

	/** default constructor */
	public FeesDetails() {
	}

	/** minimal constructor */
	public FeesDetails(Integer feesId, ClassDetails classDetails,
			Double feesAmount, Date createDate, Integer createUserId) {
		this.feesId = feesId;
		this.classDetails = classDetails;
		this.feesAmount = feesAmount;
		this.createDate = createDate;
		this.createUserId = createUserId;
	}

	/** full constructor */
	public FeesDetails(Integer feesId, ClassDetails classDetails,
			Double feesAmount, Date createDate, Integer createUserId,
			Date changeDate, Integer changeUserId, Set invoiceDetailses) {
		this.feesId = feesId;
		this.classDetails = classDetails;
		this.feesAmount = feesAmount;
		this.createDate = createDate;
		this.createUserId = createUserId;
		this.changeDate = changeDate;
		this.changeUserId = changeUserId;
		this.invoiceDetailses = invoiceDetailses;
	}

	// Property accessors

	public Integer getFeesId() {
		return this.feesId;
	}

	public void setFeesId(Integer feesId) {
		this.feesId = feesId;
	}

	public ClassDetails getClassDetails() {
		return this.classDetails;
	}

	public void setClassDetails(ClassDetails classDetails) {
		this.classDetails = classDetails;
	}

	public Double getFeesAmount() {
		return this.feesAmount;
	}

	public void setFeesAmount(Double feesAmount) {
		this.feesAmount = feesAmount;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Date getChangeDate() {
		return this.changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	public Integer getChangeUserId() {
		return this.changeUserId;
	}

	public void setChangeUserId(Integer changeUserId) {
		this.changeUserId = changeUserId;
	}

	public Set getInvoiceDetailses() {
		return this.invoiceDetailses;
	}

	public void setInvoiceDetailses(Set invoiceDetailses) {
		this.invoiceDetailses = invoiceDetailses;
	}

	public String getFeesType() {
		return feesType;
	}

	public void setFeesType(String feesType) {
		this.feesType = feesType;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}

	public String getPaidBy() {
		return paidBy;
	}

	public void setPaidBy(String paidBy) {
		this.paidBy = paidBy;
	}

	public String getPayBy() {
		return payBy;
	}

	public void setPayBy(String payBy) {
		this.payBy = payBy;
	}

	public String getCheqNo() {
		return cheqNo;
	}

	public void setCheqNo(String cheqNo) {
		this.cheqNo = cheqNo;
	}

	public String getFine() {
		return fine;
	}

	public void setFine(String fine) {
		this.fine = fine;
	}

	public String getStudentType() {
		return studentType;
	}

	public void setStudentType(String studentType) {
		this.studentType = studentType;
	}

	public String getTransportFee() {
		return transportFee;
	}

	public void setTransportFee(String transportFee) {
		this.transportFee = transportFee;
	}

	public String getHostelFee() {
		return hostelFee;
	}

	public void setHostelFee(String hostelFee) {
		this.hostelFee = hostelFee;
	}

	/*public String getScholarAmt() {
		return scholarAmt;
	}

	public void setScholarAmt(String scholarAmt) {
		this.scholarAmt = scholarAmt;
	}*/

}
