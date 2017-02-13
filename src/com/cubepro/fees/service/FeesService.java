package com.cubepro.fees.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.fees.FeesMaster;
import com.cubepro.fees.dao.FeesDAO;
import com.cubepro.general.components.Log;

public class FeesService {

	@SuppressWarnings("unchecked")
	public List<FeesMaster> findAll(Session session) throws HibernateException {
		List<FeesMaster> feesDetails = null;
		try {

			FeesDAO feesDetailsDAO = new FeesDAO(session);
			feesDetails = feesDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return feesDetails;
	}

	public boolean saveFeesMasterDetail(Session session, FeesMaster feesDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		FeesMaster feesDetailsMerged = null;
		try {
			transaction.begin();
			FeesDAO transactionDetailDAO = new FeesDAO(session);
			feesDetailsMerged = (FeesMaster) session.merge(feesDetails);
			transactionDetailDAO.save(feesDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	/**
	 * @param session
	 * @param feesDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteFeesMasterDetail(Session session,
			FeesMaster feesDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			FeesDAO transactionDetailDAO = new FeesDAO(session);
			transactionDetailDAO.delete(feesDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public FeesMaster findByFeesMasterId(int subjectId, Session session)
			throws HibernateException {
		FeesMaster feesDetails = null;
		try {

			FeesDAO feesDetailsDAO = new FeesDAO(session);
			feesDetails = feesDetailsDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return feesDetails;
	}

	@SuppressWarnings("deprecation")
	public List<FeesMaster> getDistinctFeesType(Session session, int classId) throws Exception {
		List<FeesMaster> feesMasterList;
		Connection conn = null;
		try {
			conn = session.connection();
			FeesDAO feesDetailsDAO = new FeesDAO(session);
			feesMasterList = feesDetailsDAO.getDistinctFeesType(conn, classId);
		} catch (RuntimeException re) {
			throw re;
		} finally {
			conn.close();
		}
		return feesMasterList;
	}

	@SuppressWarnings("deprecation")
	public List<FeesMaster> getDistinctFeesSubType(Session session, String feesType, int classId) throws Exception {
		List<FeesMaster> feesMasterList ;
		Connection conn = null;
		try {
			conn = session.connection();
			FeesDAO feesDetailsDAO = new FeesDAO(session);
			feesMasterList = feesDetailsDAO.getDistinctFeesSubType(conn, feesType,classId);
		} catch (RuntimeException re) {
			throw re;
		} finally {
			conn.close();
		}
		return feesMasterList;
	}
}
