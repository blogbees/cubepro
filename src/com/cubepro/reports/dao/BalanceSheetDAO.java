package com.cubepro.reports.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.student.StudentDetails;
import com.cubepro.transaction.AssetAndLiabilityDetails;

/**
 * Data access object (DAO) for domain model class StudentDetails.
 * 
 * @see StudentDetails
 * @author MyEclipse Persistence Tools
 */

public class BalanceSheetDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(BalanceSheetDAO.class);
	private static final String BALANCE_SHEET_SQL = "SELECT type, year, al_desc, sum(amount) amt FROM asset_and_liability"
			+ " where al_date between ? and ?"
			+ " and type in ( 'ASSET','LIABILITY' )"
			+ " group by type, year, al_desc ORDER BY type";

	public BalanceSheetDAO(Session session){
		super(session);
	}
	
	public List getBalanceSheetAssDetails(String fromDate, String toDate) throws SQLException{
		List assetDetails = new ArrayList();
		List liabilityDetails = new ArrayList();
		List balanceSheetDetail = new ArrayList();
		Connection conn = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		try{
			conn = session.connection();
			ps = conn.prepareStatement(BALANCE_SHEET_SQL);
			ps.clearParameters();
			ps.setString(1, fromDate);
			ps.setString(2, toDate);
			rs = ps.executeQuery();
			while(rs.next()){
				
				AssetAndLiabilityDetails assetAndLiabilityDetails = new AssetAndLiabilityDetails();
				assetAndLiabilityDetails.setType(rs.getString("type"));
				assetAndLiabilityDetails.setYear(rs.getString("year"));
				assetAndLiabilityDetails.setDesc(rs.getString("al_desc"));
				assetAndLiabilityDetails.setAmount(rs.getString("amt"));

				if(assetAndLiabilityDetails.getType().equalsIgnoreCase("ASSET")){
					assetDetails.add(assetAndLiabilityDetails);
				}else{
					liabilityDetails.add(assetAndLiabilityDetails);
				}
			}
			balanceSheetDetail.add(assetDetails);
			balanceSheetDetail.add(liabilityDetails);
		}finally{
			rs.close();
			ps.close();
			conn.close();
		}
		return balanceSheetDetail;
	}
}