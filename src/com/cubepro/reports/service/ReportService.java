package com.cubepro.reports.service;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;

import com.cubepro.general.components.Log;
import com.cubepro.reports.ReportCategory;
import com.cubepro.reports.dao.ReportListDAO;

public class ReportService {
	public List<ReportCategory> getReportCategories(Session session) throws SQLException {
		List<ReportCategory> reportCategoriesList = null;
		try {

			ReportListDAO reportListDAO = new ReportListDAO(session);
			reportCategoriesList = reportListDAO.getReportCategories();

		} catch (SQLException e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return reportCategoriesList;
	}
	
	public List getListOfReports(Session session) throws SQLException {
		List reportCategoriesList = null;
		try {

			ReportListDAO reportListDAO = new ReportListDAO(session);
			reportCategoriesList = reportListDAO.getListOfReports();

		} catch (SQLException e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return reportCategoriesList;
	}

}
