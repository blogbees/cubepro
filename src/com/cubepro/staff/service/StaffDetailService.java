package com.cubepro.staff.service;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.dao.StaffDetailsDAO;

public class StaffDetailService {

	
	/**
	 * @param searchDetails
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public List<StaffDetails> getStaffList(StaffDetails searchDetails,
			Session session) throws Exception {
		List<StaffDetails> staffDetailList = null;
		try {

			StaffDetailsDAO staffDetailsDAO = new StaffDetailsDAO(session);
			staffDetailList = staffDetailsDAO.getStaffList(searchDetails);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return staffDetailList;
	}

	/**
	 * @param studentId
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public StaffDetails getStaffDetail(Integer staffId, Session session)
			throws Exception {
		StaffDetails studentDetail = null;
		try {

			StaffDetailsDAO staffDetailsDAO = new StaffDetailsDAO(session);
			studentDetail = staffDetailsDAO.findById(staffId);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return studentDetail;
	}

	/**
	 * @param StaffDetails
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public boolean persistStaffDetail(StaffDetails staffDetails,
			Session session) throws Exception {
		boolean savedStatus = false;
		Transaction transaction = session.beginTransaction();
		try {
			StaffDetailsDAO staffDetailsDAO = new StaffDetailsDAO(session);
			staffDetails.setCreateDate(new Date());
			//TODO SET THE USER ID BASED ON THE LOGGED SESSION
			staffDetails.setCreateUserId(Integer.valueOf(1));
			staffDetails.setStatusId(Integer.valueOf(1));
			StaffDetails tobeSavedStaff = (StaffDetails) session.merge(staffDetails);
			staffDetailsDAO.save(tobeSavedStaff);
			transaction.commit();
			if(tobeSavedStaff.getStaffId()==null || tobeSavedStaff.getStaffId().intValue() ==0){
				staffDetails.setStaffId(staffDetailsDAO.getLastInsertedId());
			}

			savedStatus = true;
		} catch (Exception e) {
			transaction.rollback();
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
		return savedStatus;
	}
}
