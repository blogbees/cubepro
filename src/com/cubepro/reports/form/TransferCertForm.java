package com.cubepro.reports.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;

public class TransferCertForm extends CubeProActionForm{
	private List transferCertList = new ArrayList();
	private String rollNo;
	private String standards;
	private String acNo;
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public List getTransferCertList() {
		return transferCertList;
	}
	public void setTransferCertList(List transferCertList) {
		this.transferCertList = transferCertList;
	}
	public String getStandards() {
		return standards;
	}
	public void setStandards(String standards) {
		this.standards = standards;
	}
	public String getAcNo() {
		return acNo;
	}
	public void setAcNo(String acNo) {
		this.acNo = acNo;
	}
}
