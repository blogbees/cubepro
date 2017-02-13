package com.cubepro.subject.helper;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.classes.ClassDetails;
import com.cubepro.general.components.Log;
import com.cubepro.subject.Subject;
import com.cubepro.subject.service.SubjectService;

public class SubjectHelper {
	public List<Subject> findByClass(ClassDetails classDetails,
			Session session) throws HibernateException {
		List<Subject> subjectDetailList = null;
		SubjectService subjectDetailService = new SubjectService();
		subjectDetailList = subjectDetailService.findByClass(classDetails,
				session);
		return subjectDetailList;
	}

	public boolean saveSubjectDetail(Subject subjectDetails,
			Session session) throws HibernateException {
		SubjectService subjectDetailService = new SubjectService();
		subjectDetailService.saveSubjectDetail(session, subjectDetails);
		return true;
	}

	public boolean deleteSubjectDetail(String classId, Session session)
			throws HibernateException {
		SubjectService subjectDetailService = new SubjectService();
		subjectDetailService.deleteSubjectDetail(session, findBySubjectId(
				Integer.valueOf(classId), session));
		return true;
	}

	public Subject findBySubjectId(int subjectId, Session session)
			throws HibernateException {
		Subject subjectDetails = null;
		try {

			SubjectService subjectDetailService = new SubjectService();
			subjectDetails = subjectDetailService.findBySubjectId(Integer
					.valueOf(subjectId), session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	public List<Subject> findAll(Session session) throws HibernateException {
		List<Subject> subjectDetails = null;
		try {
			SubjectService subjectDetailService = new SubjectService();
			subjectDetails = subjectDetailService.findAll(session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "exception occured e-", e);
			throw e;
		}
		return subjectDetails;
	}


}
