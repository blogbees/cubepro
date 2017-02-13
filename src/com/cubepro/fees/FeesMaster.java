package com.cubepro.fees;

import com.cubepro.classes.ClassDetails;

public class FeesMaster {
private Integer id = Integer.valueOf(0);

private String feesType;

private String feesName;

private String feesAmt;

private String conc;

private String fine;

private String feesDate; 

private String status;

private String transportFee;

private String hostelFee;

private String scholarAmt;

private String grossAmt;

private String paidAmt;

private ClassDetails classDetails = new ClassDetails();

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public String getFeesType() {
	return feesType;
}

public void setFeesType(String feesType) {
	this.feesType = feesType;
}

public String getFeesName() {
	return feesName;
}

public void setFeesName(String feesName) {
	this.feesName = feesName;
}

public String getFeesAmt() {
	return feesAmt;
}

public void setFeesAmt(String feesAmt) {
	this.feesAmt = feesAmt;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public ClassDetails getClassDetails() {
	return classDetails;
}

public void setClassDetails(ClassDetails classDetails) {
	this.classDetails = classDetails;
}

public String getConc() {
	return conc;
}

public void setConc(String conc) {
	this.conc = conc;
}

public String getFine() {
	return fine;
}

public void setFine(String fine) {
	this.fine = fine;
}

public String getFeesDate() {
	return feesDate;
}

public void setFeesDate(String feesDate) {
	this.feesDate = feesDate;
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

public String getScholarAmt() {
	return scholarAmt;
}

public void setScholarAmt(String scholarAmt) {
	this.scholarAmt = scholarAmt;
}

public String getGrossAmt() {
	return grossAmt;
}

public void setGrossAmt(String grossAmt) {
	this.grossAmt = grossAmt;
}

public String getPaidAmt() {
	return paidAmt;
}

public void setPaidAmt(String paidAmt) {
	this.paidAmt = paidAmt;
}

}
