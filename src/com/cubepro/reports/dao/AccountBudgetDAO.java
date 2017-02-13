package com.cubepro.reports.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.registration.SchoolDAO;
import com.cubepro.registration.SchoolDetails;
import com.cubepro.reports.AccountBudgetSheet;
import com.cubepro.reports.form.AccountBudgetForm;
import com.cubepro.student.StudentDetails;
import com.cubepro.util.DateUtils;

/**
 * Data access object (DAO) for domain model class StudentDetails.
 * 
 * @see StudentDetails
 * @author MyEclipse Persistence Tools
 */

public class AccountBudgetDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(AccountBudgetDAO.class);
	private static final String INCOME_SQL = "SELECT trans_desc, sum( case when str_to_date(trans_date,'%d/%m/%Y') >= "
			+ "str_to_date(?,'%d/%m/%Y') and str_to_date(trans_date,'%d/%m/%Y') <= "
			+ "str_to_date(?,'%d/%m/%Y') then amount else 0 end) actual, "
			+ "sum( case when str_to_date(trans_date,'%d/%m/%Y') >= "
			+ "str_to_date(?,'%d/%m/%Y') and str_to_date(trans_date,'%d/%m/%Y') "
			+ "<= str_to_date(?,'%d/%m/%Y') then amount else 0 end) est1, "
			+ "sum( case when str_to_date(trans_date,'%d/%m/%Y') >= "
			+ "str_to_date(?,'%d/%m/%Y') and str_to_date(trans_date,'%d/%m/%Y') "
			+ "<= str_to_date(?,'%d/%m/%Y') then amount else 0 end) est2  "
			+ "FROM transaction_details t where str_to_date(trans_date,'%d/%m/%Y') "
			+ ">= str_to_date(?,'%d/%m/%Y') and str_to_date(trans_date,'%d/%m/%Y') "
			+ "<= str_to_date(?,'%d/%m/%Y') AND transaction_code like ? and trans_type = ?"
			+ "GROUP BY TRANS_DESC order by TRANS_DESC ";

	private static final String BUDGET_SQL = "SELECT sum(case when str_to_date(al_date,'%d/%m/%Y') >= "
			+ "str_to_date(?,'%d/%m/%Y') and str_to_date(al_date,'%d/%m/%Y') <= "
			+ "str_to_date(?,'%d/%m/%Y') then amount else 0 end ) prevb, "
			+ "sum(case when str_to_date(al_date,'%d/%m/%Y') >= str_to_date(?,'%d/%m/%Y') "
			+ "and str_to_date(al_date,'%d/%m/%Y') <= str_to_date(?,'%d/%m/%Y') then amount else 0 end ) nextb "
			+ "FROM asset_and_liability a where type='BUDGET' AND AL_desc = ? AND sub_type=? ";

	public AccountBudgetDAO(Session session) {
		super(session);
	}

	public void getAccountBudgetAssDetails(AccountBudgetForm accountBudgetForm) throws SQLException{
		Connection conn = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		PreparedStatement ps1 =null;
		ResultSet rs1 = null;
		List incomeDetails = new ArrayList();
		List expenseDetails = new ArrayList();
		List accBudgetDetail = new ArrayList();

		try{
			SchoolDAO schoolDAO = new SchoolDAO(session);
			SchoolDetails schoolDetails = (SchoolDetails)(schoolDAO.findAll().get(0));
			Date fromDate = DateUtils.getDate(accountBudgetForm.getFromDate());
			Date toDate = DateUtils.getDate(accountBudgetForm.getToDate());
			Integer prevYear = 1900 + fromDate.getYear();
			Integer nextYear = 1900 + toDate.getYear();
			accountBudgetForm.setFromYear(String.valueOf(prevYear));
			accountBudgetForm.setToYear(String.valueOf(nextYear));
			String fromDateString = "01/04/"+prevYear;
			String toDateString = "31/03/"+nextYear;
			String nextFromDateString = "01/04/"+nextYear;
			String nextToDateString = "31/03/"+(nextYear+1);
			String endYear = "31/12/"+prevYear;
			String startYear = "01/01/"+nextYear;
			accountBudgetForm.setSchoolDetails(schoolDetails);
			conn = session.connection();
			ps = conn.prepareStatement(INCOME_SQL);
			ps.clearParameters();
			ps.setString(1, fromDateString);
			ps.setString(2, toDateString);
			ps.setString(3, fromDateString);
			ps.setString(4, endYear);
			ps.setString(5, startYear);
			ps.setString(6, toDateString);
			ps.setString(7, fromDateString);
			ps.setString(8, toDateString);
			ps.setString(9, "%INCOME%");
			ps.setString(10, accountBudgetForm.getAccType());
			rs = ps.executeQuery();
			while(rs.next()){
				rs1 = null;
				AccountBudgetSheet accountBudgetSheet = new AccountBudgetSheet();
				accountBudgetSheet.setDesc(rs.getString("trans_desc"));
				accountBudgetSheet.setActuals(rs.getString("actual"));
				accountBudgetSheet.setEst1(rs.getString("est1"));
				accountBudgetSheet.setEst2(rs.getString("est2"));
				ps1 = conn.prepareStatement(BUDGET_SQL);
				ps1.clearParameters();
				ps1.setString(1, fromDateString);
				ps1.setString(2, toDateString);
				ps1.setString(3, nextFromDateString);
				ps1.setString(4, nextToDateString);
				ps1.setString(5, accountBudgetSheet.getDesc());
				ps1.setString(6, accountBudgetForm.getAccType());
				rs1 = ps1.executeQuery();
				while(rs1.next()){
					accountBudgetSheet.setPrevBudget(rs1.getString("prevb"));
					accountBudgetSheet.setNextBudget(rs1.getString("nextb"));
				}
				if(rs1!=null){
					rs1.close();
				}
				incomeDetails.add(accountBudgetSheet);
			}
			if (rs != null)
				rs.close();
			ps.setString(9, "%EXPENSE%");
			rs = ps.executeQuery();
			while(rs.next()){
				rs1 = null;
				AccountBudgetSheet accountBudgetSheet = new AccountBudgetSheet();
				accountBudgetSheet.setDesc(rs.getString("trans_desc"));
				accountBudgetSheet.setActuals(rs.getString("actual"));
				accountBudgetSheet.setEst1(rs.getString("est1"));
				accountBudgetSheet.setEst2(rs.getString("est2"));
				ps1 = conn.prepareStatement(BUDGET_SQL);
				ps1.clearParameters();
				ps1.setString(1, fromDateString);
				ps1.setString(2, toDateString);
				ps1.setString(3, nextFromDateString);
				ps1.setString(4, nextToDateString);
				ps1.setString(5, accountBudgetSheet.getDesc());
				ps1.setString(6, accountBudgetForm.getAccType());
				rs1 = ps1.executeQuery();
				while(rs1.next()){
					accountBudgetSheet.setPrevBudget(rs1.getString("prevb"));
					accountBudgetSheet.setNextBudget(rs1.getString("nextb"));
				}
				if(rs1!=null){
					rs1.close();
				}
				expenseDetails.add(accountBudgetSheet);
			}
			accBudgetDetail.add(incomeDetails);
			accBudgetDetail.add(expenseDetails);
			accountBudgetForm.setAccountBudgetAssList(accBudgetDetail);
		}finally{
			if (rs != null)
				rs.close();
			if (ps1 != null)
				ps1.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
	}
}