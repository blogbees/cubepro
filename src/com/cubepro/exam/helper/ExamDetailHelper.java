package com.cubepro.exam.helper;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.exam.ExamDetails;
import com.cubepro.exam.service.ExamDetailService;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.subject.service.SubjectDetailService;

public class ExamDetailHelper {
	private static final Log LOG = LogFactory.getLog(ExamDetailHelper.class);

	public List<ExamDetails> findAll(Session session) throws HibernateException {
		List<ExamDetails> examDetails = null;
		try {
			ExamDetailService examDetailService = new ExamDetailService();
			examDetails = examDetailService.findAll(session);
		} catch (HibernateException e) {
			LOG.error("EXCEption occured ...", e);
			throw e;
		}
		return examDetails;
	}

	public boolean saveExamDetail(ExamDetails examDetails, Session session)
			throws HibernateException {
		ExamDetailService examDetailService = new ExamDetailService();
		examDetailService.saveExamDetail(session, examDetails);
		return true;
	}

	public boolean deleteExamDetail(String examId, Session session)
			throws HibernateException {
		ExamDetailService examDetailService = new ExamDetailService();
		examDetailService.deleteExamDetail(session, findByExamId(Integer
				.valueOf(examId), session));
		return true;
	}

	public ExamDetails findByExamId(int examId, Session session)
			throws HibernateException {
		ExamDetails subjectDetails = null;
		try {

			ExamDetailService subjectDetailService = new ExamDetailService();
			subjectDetails = subjectDetailService.findByExamId(Integer
					.valueOf(examId), session);
		} catch (HibernateException e) {
			LOG.error("EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	public List<ExamDetails> findByClassId(int classId, Session session)
	throws HibernateException {
		List<ExamDetails> subjectDetails = null;
		try {
			ExamDetailService subjectDetailService = new ExamDetailService();
			subjectDetails = subjectDetailService.findByClassId(Integer
					.valueOf(classId), session);
		} catch (HibernateException e) {
			LOG.error("EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public ExamDetails findById(final int examId, Session session)
			throws HibernateException {
		ExamDetails examDetails = null;
		try {
			ExamDetailService examDetailService = new ExamDetailService();
			examDetails = examDetailService.findById(Integer.valueOf(examId),
					session);
		} catch (HibernateException e) {
			LOG.error("EXCEption occured ...", e);
			throw e;
		}
		return examDetails;
	}

}
