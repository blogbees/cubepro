package com.cubepro.reports.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.registration.SchoolDetails;

public class AccountBudgetForm extends CubeProActionForm{

	private List accountBudgetAssList = new ArrayList();
	
	private String fromDate ;
	
	private String toDate;
	
private String fromYear ;
	
	private String toYear;
	
	private String accType;
	
	private SchoolDetails schoolDetails = new SchoolDetails();

	public List getAccountBudgetAssList() {
		return accountBudgetAssList;
	}

	public void setAccountBudgetAssList(List accountBudgetAssList) {
		this.accountBudgetAssList = accountBudgetAssList;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getAccType() {
		return accType;
	}

	public void setAccType(String accType) {
		this.accType = accType;
	}

	public SchoolDetails getSchoolDetails() {
		return schoolDetails;
	}

	public void setSchoolDetails(SchoolDetails schoolDetails) {
		this.schoolDetails = schoolDetails;
	}

	public String getFromYear() {
		return fromYear;
	}

	public void setFromYear(String fromYear) {
		this.fromYear = fromYear;
	}

	public String getToYear() {
		return toYear;
	}

	public void setToYear(String toYear) {
		this.toYear = toYear;
	}

}
