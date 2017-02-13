package com.cubepro.reports;

import java.util.Iterator;
import java.util.List;

import com.cubepro.general.database.HibernateSessionFactory;
import com.cubepro.reports.dao.ReportListDAO;

public class ReportCategory {

	int categoryId;
	
	String categoryName;
	
	String categoryDesc;

	public String getCategoryDesc() {
		return categoryDesc;
	}

	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	public String getReportsAsHTMLString(int reportCategoryId) throws Exception {
		StringBuffer htmlAsString = new StringBuffer();
		int tdBreakUp = 0;
		try {
			List<Report> reportList = null;
			ReportListDAO reportListDAO = new ReportListDAO(HibernateSessionFactory.getSession());
			Report report = null;
			reportList = reportListDAO
					.getReports(reportCategoryId);
			Iterator<Report> rptPmIterator = reportList.iterator();
			htmlAsString.append("<table cellpadding='0' cellspacing='0' border='0' align= 'center' width='100%' >");
			while (rptPmIterator.hasNext()) {
				report = rptPmIterator.next();
				if(tdBreakUp == 0)
					htmlAsString.append("<tr>");	
					htmlAsString.append("<td><a href='javascript:loadReportParameters("+report.getReportId()+");'>");
					htmlAsString.append(report.getReportName());
					htmlAsString.append("</a></td>");
				tdBreakUp = tdBreakUp + 1;
				if(tdBreakUp == 5){
					htmlAsString.append("</tr>");
					tdBreakUp = 0;
				}
			}
			for(int i = tdBreakUp; i < (tdBreakUp*2); i++){
				htmlAsString.append("<td>&nbsp;</td>");	
			}
			htmlAsString.append("</table>");
		} catch (Exception e) {
			throw e;
		}
		return htmlAsString.toString();
	}

}
