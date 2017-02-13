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
import com.cubepro.registration.SchoolDAO;
import com.cubepro.registration.SchoolDetails;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.dao.StudentDetailsDAO;
import com.cubepro.transaction.AssetAndLiabilityDetails;

/**
 * Data access object (DAO) for domain model class StudentDetails.
 * 
 * @see StudentDetails
 * @author MyEclipse Persistence Tools
 */

public class TransferCertDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(TransferCertDAO.class);
	private static final String TRANSFER_CERT_SQL = "SELECT type, year, al_desc, sum(amount) amt FROM asset_and_liability"
			+ " where al_date between ? and ?"
			+ " and type in ( 'ASSET','LIABILITY' )"
			+ " group by type, year, al_desc ORDER BY type";

	public TransferCertDAO(Session session){
		super(session);
	}
	
	public List getTransferCertDetails(String rollNo) throws SQLException{
		List transferDetail = new ArrayList();
		StudentDetails studentDetails = null;
		try{
			StudentDetailsDAO studentDetailsDAO = new StudentDetailsDAO(session);
			studentDetails = (StudentDetails)studentDetailsDAO.findByAdmissionNo(rollNo).get(0);
			SchoolDAO schoolDAO = new SchoolDAO(session);
			SchoolDetails schoolDetails = (SchoolDetails)(schoolDAO.findAll().get(0));
			transferDetail.add(studentDetails);
			transferDetail.add(schoolDetails);
		}finally{
		}
		return transferDetail;
	}
}