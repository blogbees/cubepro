package com.cubepro.student.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.classes.ClassDetailsDAO;
import com.cubepro.general.components.Log;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.StudentHomeWork;
import com.cubepro.student.dao.StudentDetailsDAO;
import com.cubepro.student.dao.StudentHomeWorkDAO;

public class StudentDetailService {

	/**
	 * @param searchDetails
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public List<StudentDetails> getStudentList(StudentDetails searchDetails,
			Session session) throws Exception {
		List<StudentDetails> studentDetailList = null;
		try {

			StudentDetailsDAO studentDetailsDAO = new StudentDetailsDAO(session);
			studentDetailList = studentDetailsDAO.getStudentList(searchDetails);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return studentDetailList;
	}

	/**
	 * @param studentId
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public StudentDetails getStudentDetail(Integer studentId, Session session)
			throws Exception {
		StudentDetails studentDetail = null;
		try {

			StudentDetailsDAO studentDetailsDAO = new StudentDetailsDAO(session);
			studentDetail = studentDetailsDAO.findById(studentId);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return studentDetail;
	}

	public void updateAllStudentsClass(Long fromClassId, Long toClassId,
			Session session) throws Exception {
		try {

			StudentDetailsDAO studentDetailsDAO = new StudentDetailsDAO(session);
			studentDetailsDAO.updateAllStudentsClass(fromClassId,toClassId);
		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
	}
	public int getAllStudentsCount(Long fromClassId,Session session) throws Exception {
		int k=0;
		try {
            StudentDetailsDAO studentDetailsDAO = new StudentDetailsDAO(session);
		    k=studentDetailsDAO.getAllStudentsCount(fromClassId);
			
		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
		return k;
	}
	public void updateAllStudentsClass(Long fromClassId, Long toClassId, String admissionNo,
			Session session) throws Exception {
		try {

			StudentDetailsDAO studentDetailsDAO = new StudentDetailsDAO(session);
			studentDetailsDAO.updateAllStudentsClass(fromClassId,toClassId,admissionNo);
		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
	}

	public List<StudentDetails> getFeesStudentsList(
			StudentDetails searchDetails, String fromDate,String toDate,
			Session session) throws Exception {
		List<StudentDetails> studentFeeDetailList = null;
		try {

			StudentDetailsDAO studentFeeDetailsDAO = new StudentDetailsDAO(
					session);
			studentFeeDetailList = studentFeeDetailsDAO.getStudentFeesList(searchDetails,fromDate,toDate);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

	return studentFeeDetailList;
}
	
	
	public List<StudentDetails> getHomeWorkStudentsList(
			StudentDetails searchDetails, String fromDate,String toDate,
			Session session) throws Exception {
		List<StudentDetails> studentFeeDetailList = null;
		try {

			StudentDetailsDAO studentFeeDetailsDAO = new StudentDetailsDAO(
					session);
			studentFeeDetailList = studentFeeDetailsDAO.getStudentHomeWorkList(searchDetails,fromDate,toDate);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
	return studentFeeDetailList;
	}

	/**
	 * @param studentDetails
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public Integer persistStudentDetail(StudentDetails studentDetails,
			Session session) throws Exception {
		Transaction transaction = session.beginTransaction();
		StudentDetails studentDetail = null;
		try {
			StudentDetailsDAO studentDetailsDAO = new StudentDetailsDAO(session);
			studentDetails.setStatus(Integer.valueOf(1));
			studentDetail = (StudentDetails) session.merge(studentDetails);
			studentDetailsDAO.save(studentDetail);
			transaction.commit();
			if (studentDetail.getStudentId() == null
					|| studentDetail.getStudentId().intValue() == 0) {
				studentDetails.setStudentId(studentDetailsDAO
						.getLastInsertedId());
			}
		} catch (Exception e) {
			transaction.rollback();
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
		return studentDetail.getStudentId();
	}
	
	

	

	@SuppressWarnings("unchecked")
	public List<StudentHomeWork> findAllStudentHomeWorks(Session session) throws HibernateException {
		List<StudentHomeWork> subjectDetails = null;
		try {

			StudentHomeWorkDAO subjectDetailsDAO = new StudentHomeWorkDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveStudentHomeWorkDetail(Session session, StudentHomeWork subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		StudentHomeWork subjectDetailsMerged = null;
		try {
			transaction.begin();
			StudentHomeWorkDAO transactionDetailDAO = new StudentHomeWorkDAO(session);
			ClassDetailsDAO classDetailDAO = new ClassDetailsDAO(session);
			subjectDetails.setClassDetail(classDetailDAO.findById(subjectDetails.getClassDetail().getClassId()));
			subjectDetailsMerged = (StudentHomeWork) session.merge(subjectDetails);
			transactionDetailDAO.save(subjectDetailsMerged);
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
	 * @param subjectDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteStudentHomeWorkDetail(Session session, StudentHomeWork subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			StudentHomeWorkDAO transactionDetailDAO = new StudentHomeWorkDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public StudentHomeWork findByStudentHomeWorkId(int subjectId, Session session)
			throws HibernateException {
		StudentHomeWork term = null;
		try {

			StudentHomeWorkDAO termDAO = new StudentHomeWorkDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}
}
