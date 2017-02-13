package com.cubepro.registration.service;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.registration.SchoolDAO;
import com.cubepro.registration.SchoolDetails;

public class SchoolDetailsService {
	/**
	 * @param session
	 * @return
	 * @throws HibernateException
	 */
	public List<SchoolDetails> findAll(Session session)
			throws HibernateException {
		List<SchoolDetails> schoolDetails = null;
		try {

			SchoolDAO schoolDetailsDAO = new SchoolDAO(session);
			schoolDetails = schoolDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}
		return schoolDetails;
	}

	public boolean saveSchoolDetails(SchoolDetails schoolDetails, Session session) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		SchoolDetails timeTableDetails = null;
		try {
			transaction.begin();
			SchoolDAO schoolDAO = new SchoolDAO(
					session);
			if(schoolDetails.getSchoolId()==0)
				schoolDetails.setCreateDate(new Date());
			timeTableDetails = (SchoolDetails)session.merge(schoolDetails);
			schoolDAO.save(timeTableDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}


}
