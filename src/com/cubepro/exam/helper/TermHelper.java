package com.cubepro.exam.helper;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.exam.Term;
import com.cubepro.exam.service.TermService;
import com.cubepro.general.components.Log;

public class TermHelper {
	
	public boolean saveTermDetail(Term subjectDetails,
			Session session) throws HibernateException {
		TermService termService = new TermService();
		termService.saveTermDetail(session, subjectDetails);
		return true;
	}

	public boolean deleteTermDetail(String classId, Session session)
			throws HibernateException {
		TermService termService = new TermService();
		termService.deleteTermDetail(session, findByTermId(
				Integer.valueOf(classId), session));
		return true;
	}

	public Term findByTermId(int subjectId, Session session)
			throws HibernateException {
		Term subjectDetails = null;
		try {

			TermService termService = new TermService();
			subjectDetails = termService.findByTermId(Integer
					.valueOf(subjectId), session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	public List<Term> findAll(Session session) throws HibernateException {
		List<Term> subjectDetails = null;
		try {
			TermService termService = new TermService();
			subjectDetails = termService.findAll(session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "exception occured e-", e);
			throw e;
		}
		return subjectDetails;
	}



}
