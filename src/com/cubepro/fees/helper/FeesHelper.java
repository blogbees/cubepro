package com.cubepro.fees.helper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.fees.FeesMaster;
import com.cubepro.fees.dao.FeesDAO;
import com.cubepro.fees.service.FeesService;
import com.cubepro.general.components.Log;

public class FeesHelper {

	public boolean saveFeesMasterDetail(FeesMaster fees,
			Session session) throws HibernateException {
		FeesService feesService = new FeesService();
		feesService.saveFeesMasterDetail(session, fees);
		return true;
	}

	public boolean deleteFeesMasterDetail(String classId, Session session)
			throws HibernateException {
		FeesService feesService = new FeesService();
		feesService.deleteFeesMasterDetail(session, findByFeesMasterId(
				Integer.valueOf(classId), session));
		return true;
	}

	public FeesMaster findByFeesMasterId(int feesId, Session session)
			throws HibernateException {
		FeesMaster fees = null;
		try {

			FeesService feesService = new FeesService();
			fees = feesService.findByFeesMasterId(Integer
					.valueOf(feesId), session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return fees;
	}
	
	public List<FeesMaster> findAll(Session session) throws HibernateException {
		List<FeesMaster> feess = null;
		try {
			FeesService feesService = new FeesService();
			feess = feesService.findAll(session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "exception occured e-", e);
			throw e;
		}
		return feess;
	}

	public List<FeesMaster> getDistinctFeesType(Session session,Integer classId) throws Exception {
		List<FeesMaster> feesMasterList ;
		try {
			FeesService feesService = new FeesService();
			feesMasterList = feesService.getDistinctFeesType(session,classId.intValue());
		} catch (RuntimeException re) {
			throw re;
		}
		return feesMasterList;
	}

	public List<FeesMaster> getDistinctFeesSubType(Session session, String feesType, Integer classId) throws Exception {
		List<FeesMaster> feesMasterList ;
		try {
			FeesService feesService = new FeesService();
			feesMasterList = feesService.getDistinctFeesSubType(session, feesType, classId.intValue());
		} catch (RuntimeException re) {
			throw re;
		}
		return feesMasterList;
	}

}
