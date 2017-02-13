package com.cubepro.subject.helper;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.classes.ClassDetails;
import com.cubepro.classes.service.ClassDetailService;
import com.cubepro.general.components.Log;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.subject.service.SubjectDetailService;

public class SubjectDetailHelper {

	public List<SubjectDetails> findByClass(ClassDetails classDetails,
			Session session) throws HibernateException {
		List<SubjectDetails> subjectDetailList = null;
		SubjectDetailService subjectDetailService = new SubjectDetailService();
		subjectDetailList = subjectDetailService.findByClass(classDetails,
				session);
		return subjectDetailList;
	}

	public boolean saveSubjectDetail(SubjectDetails subjectDetails,
			Session session) throws HibernateException {
		SubjectDetailService subjectDetailService = new SubjectDetailService();
		subjectDetailService.saveSubjectDetail(session, subjectDetails);
		return true;
	}

	public boolean deleteSubjectDetail(String classId, Session session)
			throws HibernateException {
		SubjectDetailService subjectDetailService = new SubjectDetailService();
		subjectDetailService.deleteSubjectDetail(session, findBySubjectId(
				Integer.valueOf(classId), session));
		return true;
	}

	public SubjectDetails findBySubjectId(int subjectId, Session session)
			throws HibernateException {
		SubjectDetails subjectDetails = null;
		try {

			SubjectDetailService subjectDetailService = new SubjectDetailService();
			subjectDetails = subjectDetailService.findBySubjectId(Integer
					.valueOf(subjectId), session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	public List<SubjectDetails> findAll(Session session) throws HibernateException {
		List<SubjectDetails> subjectDetails = null;
		try {
			SubjectDetailService subjectDetailService = new SubjectDetailService();
			subjectDetails = subjectDetailService.findAll(session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "exception occured e-", e);
			throw e;
		}
		return subjectDetails;
	}


}
