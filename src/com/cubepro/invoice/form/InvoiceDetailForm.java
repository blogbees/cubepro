package com.cubepro.invoice.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.fees.FeesDetails;
import com.cubepro.fees.FeesMaster;
import com.cubepro.invoice.InvoiceDetails;

public class InvoiceDetailForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3815219148832664317L;
	
	private InvoiceDetails invoiceDetails = new InvoiceDetails();
	
	private List<FeesDetails> feesDetails = new ArrayList<FeesDetails>();
	
	private List<FeesMaster> feesType = new ArrayList<FeesMaster>();
	
	private List<FeesMaster> feesSubType = new ArrayList<FeesMaster>();
	
	private List<FeesMaster> invoicePrintDetails = new ArrayList<FeesMaster>();
	
	private int classId = 1;
	
	private int studentId;
	
	private String selectedName;
	
	private String selectedValue;
	
	private String scholarAmt;
	
	private String paidAmt;
	
	private String balanceAmt;
	
	private List<InvoiceDetails> invoiceDetailList;
	public InvoiceDetails getInvoiceDetails() {
		return invoiceDetails;
	}

	public void setInvoiceDetails(InvoiceDetails invoiceDetails) {
		this.invoiceDetails = invoiceDetails;
	}

	public List<InvoiceDetails> getInvoiceDetailList() {
		return invoiceDetailList;
	}

	public void setInvoiceDetailList(List<InvoiceDetails> invoiceDetailList) {
		this.invoiceDetailList = invoiceDetailList;
	}

	public List<FeesDetails> getFeesDetails() {
		return feesDetails;
	}

	public void setFeesDetails(List<FeesDetails> feesDetails) {
		this.feesDetails = feesDetails;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public List<FeesMaster> getFeesType() {
		return feesType;
	}

	public void setFeesType(List<FeesMaster> feesType) {
		this.feesType = feesType;
	}

	public List<FeesMaster> getFeesSubType() {
		return feesSubType;
	}

	public void setFeesSubType(List<FeesMaster> feesSubType) {
		this.feesSubType = feesSubType;
	}

	public String getSelectedName() {
		return selectedName;
	}

	public void setSelectedName(String selectedName) {
		this.selectedName = selectedName;
	}

	public String getSelectedValue() {
		return selectedValue;
	}

	public void setSelectedValue(String selectedValue) {
		this.selectedValue = selectedValue;
	}

	public List<FeesMaster> getInvoicePrintDetails() {
		return invoicePrintDetails;
	}

	public void setInvoicePrintDetails(List<FeesMaster> invoicePrintDetails) {
		this.invoicePrintDetails = invoicePrintDetails;
	}

	public String getScholarAmt() {
		return scholarAmt;
	}

	public void setScholarAmt(String scholarAmt) {
		this.scholarAmt = scholarAmt;
	}

	public String getPaidAmt() {
		return paidAmt;
	}

	public void setPaidAmt(String paidAmt) {
		this.paidAmt = paidAmt;
	}

	public String getBalanceAmt() {
		return balanceAmt;
	}

	public void setBalanceAmt(String balanceAmt) {
		this.balanceAmt = balanceAmt;
	}

}
