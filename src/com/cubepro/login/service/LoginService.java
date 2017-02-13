package com.cubepro.login.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.login.dao.LoginDetailsDAO;
import com.cubepro.login.entity.LoginDetails;

public class LoginService {
	private static final Log LOG = LogFactory.getLog(LoginService.class);
	public List getUserDetails(String userName, String passWord, Session session)
			throws HibernateException, GenericJDBCException,
			SQLException {
		List userDetails = null;
		try {
			
			LoginDetailsDAO loginDetails = new LoginDetailsDAO(session);
			userDetails = loginDetails.getUserDetails(userName, passWord);

		} catch (SQLException e) {
			LOG.error("EXCEption occured ...", e);
			throw e;
		}
		return userDetails;
	}
	
	@SuppressWarnings("unchecked")
	public List<LoginDetails> findAll(Session session) throws HibernateException {
		List<LoginDetails> feesDetails = null;
		try {

			LoginDetailsDAO feesDetailsDAO = new LoginDetailsDAO(session);
			feesDetails = feesDetailsDAO.findAll();

		} catch (HibernateException e) {
			
			throw e;
		}
		return feesDetails;
	}

	public boolean saveLoginDetails(Session session, LoginDetails loginDetails)
			throws Exception {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		LoginDetails loginDetailsMerged = null;
		try {
			transaction.begin();
			LoginDetailsDAO transactionDetailDAO = new LoginDetailsDAO(session);
			loginDetails.setPassword(transactionDetailDAO.getMd5Value(loginDetails.getPassword()));
			loginDetailsMerged = (LoginDetails) session.merge(loginDetails);
			transactionDetailDAO.save(loginDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}finally{
			session.clear();
		}
		return status;
	}

	public LoginDetails findByLoginDetailsId(int loginDetailsId, Session session)
			throws HibernateException {
		LoginDetails loginDetails = null;
		try {

			LoginDetailsDAO loginDetailsDAO = new LoginDetailsDAO(session);
			loginDetails = loginDetailsDAO.findById(Integer.valueOf(loginDetailsId));
		} catch (HibernateException e) {
			
			throw e;
		}
		return loginDetails;
	}

}
