package com.cubepro.reports.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;

public class BalanceSheetForm extends CubeProActionForm{

	private List balanceSheetAssList = new ArrayList();
	
	private String fromDate ;
	
	private String toDate;

	public List getBalanceSheetAssList() {
		return balanceSheetAssList;
	}

	public void setBalanceSheetAssList(List balanceSheetAssList) {
		this.balanceSheetAssList = balanceSheetAssList;
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
}
