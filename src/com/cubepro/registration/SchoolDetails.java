/*******************************************************************************
 *    COPYRIGHT, 2009, Cubicle Technologies 
 ********************************************************************************
 *
 *             CONFIDENTIAL - Cubicle Technologies , Inc.  (www.cubicletech.com)
 *
 * This is an unpublished work, which is a trade secret, created in 2009.
 * Cubicle Technologies owns all rights to this work and intends to maintain it in confidence
 * to preserve its trade secret status. Cubicle Technologies reserves the right to protect
 * this work as an unpublished copyrighted work in the event of an inadvertent or
 * deliberate unauthorized publication. Cubicle Technologies also reserves its rights under the
 * copyright laws to protect this work as a published work. Those having access
 * to this work may not copy it, use it, or disclose the information contained
 * in it without the written authorization of Cubicle Technologies.
 *
 ********************************************************************************
 * NAME: 
 * LOCATION: Cubicle Technologies,
 * BUSINESS OWNERS:   
 * PRIMARY PROJECT CONTACT:  
 * DEVELOPED BY: CubePro J2EE Team
 *
 * DESCRIPTION: 
 * NOTES:
 * DEPENDENCIES:
 * $Log:$ 
 */
package com.cubepro.registration;

import java.util.Date;

public class SchoolDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7393751285731974807L;

	private int schoolId = Integer.valueOf(0);
	
	private String schoolName;

	private String address1;

	private String address2;

	private String city;

	private String state;

	private String country;

	private String zipCode;

	private String phoneNo1;

	private String phoneNo2;

	private String faxNo;

	private String mobileNo;

	private String email;

	private String website;

	private int noOfWorkingDays;

	private Date createDate;
	
	private String classes;
	
	private String division;
	
	private String category;
	
	private String subCategory;
	
	private String govtRegNo;
	
	private String validityDate;
	
	private String corresName;
	
	private String principal;
	
	private String headMasterName;
	
	private String mgmtName;
	
	private String revDis;
	
	private String logo;
	
	private String eduDis;

	private String staffMaxLeave;

	private String studentMaxLeave;
	
	private String smsName;
	
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getPhoneNo1() {
		return phoneNo1;
	}

	public void setPhoneNo1(String phoneNo1) {
		this.phoneNo1 = phoneNo1;
	}

	public String getPhoneNo2() {
		return phoneNo2;
	}

	public void setPhoneNo2(String phoneNo2) {
		this.phoneNo2 = phoneNo2;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getNoOfWorkingDays() {
		return noOfWorkingDays;
	}

	public void setNoOfWorkingDays(int noOfWorkingDays) {
		this.noOfWorkingDays = noOfWorkingDays;
	}

	public int getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	public String getClasses() {
		return classes;
	}

	public void setClasses(String classes) {
		this.classes = classes;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getGovtRegNo() {
		return govtRegNo;
	}

	public void setGovtRegNo(String govtRegNo) {
		this.govtRegNo = govtRegNo;
	}

	public String getCorresName() {
		return corresName;
	}

	public void setCorresName(String corresName) {
		this.corresName = corresName;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getHeadMasterName() {
		return headMasterName;
	}

	public void setHeadMasterName(String headMasterName) {
		this.headMasterName = headMasterName;
	}

	public String getMgmtName() {
		return mgmtName;
	}

	public void setMgmtName(String mgmtName) {
		this.mgmtName = mgmtName;
	}

	public String getValidityDate() {
		return validityDate;
	}

	public void setValidityDate(String validityDate) {
		this.validityDate = validityDate;
	}

	public String getRevDis() {
		return revDis;
	}

	public void setRevDis(String revDis) {
		this.revDis = revDis;
	}

	public String getEduDis() {
		return eduDis;
	}

	public void setEduDis(String eduDis) {
		this.eduDis = eduDis;
	}

	public String getStaffMaxLeave() {
		return staffMaxLeave;
	}

	public void setStaffMaxLeave(String staffMaxLeave) {
		this.staffMaxLeave = staffMaxLeave;
	}

	public String getStudentMaxLeave() {
		return studentMaxLeave;
	}

	public void setStudentMaxLeave(String studentMaxLeave) {
		this.studentMaxLeave = studentMaxLeave;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getSmsName() {
		return smsName;
	}

	public void setSmsName(String smsName) {
		this.smsName = smsName;
	}
}
