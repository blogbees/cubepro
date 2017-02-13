package com.cubepro.reports.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.reports.Report;
import com.cubepro.reports.ReportCategory;
import com.cubepro.reports.ReportParameter;
import com.cubepro.util.DatabaseConnector;

public class ReportListDAO extends BaseHibernateDAO{
	private static final String SQL_GET_ALL_RPT_CTGY_LIST = " select category_id, category_name, category_desc from report_category order by category_id ";

	private static final String SQL_GET_ALL_REP_LIST = "SELECT report_id, report_name, report_desc, rc.category_id, category_name, category_desc , report_action FROM reports r "
			+ " inner join report_category rc	on r.category_id = rc.category_id "
			+ " order by rc.category_id";
	
	private static final String SQL_GET_ALL_REP_LIST_BY_ID = "SELECT report_id, report_name, report_desc, rc.category_id, category_name, category_desc , report_action FROM reports r "
		+ " inner join report_category rc on r.category_id = rc.category_id where rc.category_id = ? "
		+ " order by rc.category_id";


	private static final String SQL_GET_RPT_PARAMETERS_LIST = "SELECT rpt_id, r.report_id, r.report_name, r.report_desc, param_type, param_size, param_maxlength, "
			+ " param_name,param_position, param_jsonclick, param_query, param_isCombo, param_value, r.report_action	 "
			+ " from report_parameters rp inner join reports r on r.report_id = rp.report_id 	 "
			+ " where r.report_id = ? order by param_position";
	
	public ReportListDAO(Session session){
		super(session);
	}

	public List<ReportCategory> getReportCategories() throws SQLException {
		List<ReportCategory> reportCategoryList = new ArrayList<ReportCategory>();
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = session.connection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;

			try {

				pstmt = connection.prepareStatement(SQL_GET_ALL_RPT_CTGY_LIST);
				rst = pstmt.executeQuery();
				while (rst.next()) {
					ReportCategory reportCategory = new ReportCategory();
					reportCategory.setCategoryId(rst.getInt(1));
					reportCategory.setCategoryName(rst.getString(2));
					reportCategory.setCategoryDesc(rst.getString(3));
					reportCategoryList.add(reportCategory);
				}
			} catch (final SQLException e) {
				throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
		} catch (final SQLException e) {
			throw e;
		}
		return reportCategoryList;
	}

	public List<Report> getReports(int reportCategoryId) throws SQLException {
		List<Report> reportList = new ArrayList<Report>();
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = session.connection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;

			try {

				pstmt = connection.prepareStatement(SQL_GET_ALL_REP_LIST_BY_ID);
				pstmt.setInt(1, reportCategoryId);
				rst = pstmt.executeQuery();
				while (rst.next()) {
					Report report = new Report();
					ReportCategory reportCategory = new ReportCategory();
					report.setReportId(rst.getInt(1));
					report.setReportName(rst.getString(2));
					report.setReportDesc(rst.getString(3));
					reportCategory.setCategoryId(rst.getInt(4));
					reportCategory.setCategoryName(rst.getString(5));
					reportCategory.setCategoryDesc(rst.getString(6));
					report.setReportAction(rst.getString(7));
					report.setReportCategory(reportCategory);
					reportList.add(report);
				}
			} catch (final SQLException e) {
				throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
		} catch (final SQLException e) {
			throw e;
		}
		return reportList;
	}

	
	public List getListOfReports() throws SQLException {
		List reportList = new ArrayList();
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = session.connection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;

			try {

				pstmt = connection.prepareStatement(SQL_GET_ALL_REP_LIST);
				rst = pstmt.executeQuery();
				while (rst.next()) {
					Report report = new Report();
					ReportCategory reportCategory = new ReportCategory();
					report.setReportId(rst.getInt(1));
					report.setReportName(rst.getString(2));
					report.setReportDesc(rst.getString(3));
					reportCategory.setCategoryId(rst.getInt(4));
					reportCategory.setCategoryName(rst.getString(5));
					reportCategory.setCategoryDesc(rst.getString(6));
					report.setReportAction(rst.getString(7));
					report.setReportCategory(reportCategory);
					reportList.add(report);
				}
			} catch (final SQLException e) {
				throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
		} catch (final SQLException e) {
			throw e;
		}
		return reportList;
	}

	public List<ReportParameter> getListOfReportParameters(final int reportId) throws Exception {
		List<ReportParameter> reportParameterList = new ArrayList<ReportParameter>();
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = session.connection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;

			try {

				pstmt = connection.prepareStatement(SQL_GET_RPT_PARAMETERS_LIST);
				pstmt.setInt(1, reportId);
				rst = pstmt.executeQuery();
				while (rst.next()) {
					ReportParameter reportParameter = new ReportParameter();
					Report report = new Report();
					reportParameter.setReportParameterId(rst.getInt(1));
					report.setReportId(rst.getInt(2));
					report.setReportName(rst.getString(3));
					report.setReportDesc(rst.getString(4));

					reportParameter.setParameterType(rst.getString(5));
					reportParameter.setParameterSize(rst.getInt(6));
					reportParameter.setParameterMaxLength(rst.getInt(7));
					reportParameter.setParameterName(rst.getString(8));
					reportParameter.setParameterPosition(rst.getInt(9));
					reportParameter.setParameterJSScriptOnClick(rst
							.getString(10));
					reportParameter.setParameterQuery(rst.getString(11));
					reportParameter.setParameterisCombo(rst.getInt(12));
					reportParameter.setParameterValue(rst.getString(13));
					report.setReportAction(rst.getString(14));
					reportParameter.setReport(report);
					reportParameterList.add(reportParameter);
				}
			} catch (final SQLException e) {
				throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
		} catch (final SQLException e) {
			throw e;
		}
		return reportParameterList;
	}

}

