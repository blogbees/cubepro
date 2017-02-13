package com.cubepro.reports.form;

import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.reports.ReportCategory;

public class ReportListForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3684009556930832220L;

	List<ReportCategory> reportCategoryList;

	List reportList;
	
	public List<ReportCategory> getReportCategoryList() {
		return reportCategoryList;
	}

	public void setReportCategoryList(List<ReportCategory> reportCategoryList) {
		this.reportCategoryList = reportCategoryList;
	}

	public List getReportList() {
		return reportList;
	}

	public void setReportList(List reportList) {
		this.reportList = reportList;
	}

}
