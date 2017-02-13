package com.cubepro.reports;

public class Report {

	private int reportId;
	
	private String reportName;
	
	private ReportCategory reportCategory;
	
	private String reportDesc;
	
	private String reportAction;

	public ReportCategory getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(ReportCategory reportCategory) {
		this.reportCategory = reportCategory;
	}

	public String getReportDesc() {
		return reportDesc;
	}

	public void setReportDesc(String reportDesc) {
		this.reportDesc = reportDesc;
	}

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getReportAction() {
		return reportAction;
	}

	public void setReportAction(String reportAction) {
		this.reportAction = reportAction;
	}
}
