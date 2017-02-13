package com.cubepro.library.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.library.Book;
import com.cubepro.library.Category;
import com.cubepro.library.StaffLendDetails;
import com.cubepro.library.StudentLendDetails;
import com.cubepro.library.dao.BookDAO;
import com.cubepro.library.dao.CategoryDAO;
import com.cubepro.library.dao.StaffLendDetailsDAO;
import com.cubepro.library.dao.StudentLendDetailsDAO;
import com.cubepro.util.DateUtils;

public class LibraryService {

	@SuppressWarnings("unchecked")
	public List<Category> findAllCategory(Session session)
			throws HibernateException {
		List<Category> subjectDetails = null;
		try {

			CategoryDAO subjectDetailsDAO = new CategoryDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveCategoryDetail(Session session,
			Category subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Category subjectDetailsMerged = null;
		try {
			transaction.begin();
			CategoryDAO transactionDetailDAO = new CategoryDAO(session);
			subjectDetailsMerged = (Category) session.merge(subjectDetails);
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
	public boolean deleteCategoryDetail(Session session,
			Category subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			CategoryDAO transactionDetailDAO = new CategoryDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Category findByCategoryId(int subjectId, Session session)
			throws HibernateException {
		Category term = null;
		try {

			CategoryDAO termDAO = new CategoryDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

	@SuppressWarnings("unchecked")
	public List<Book> findAllBooks(Session session) throws HibernateException {
		List<Book> subjectDetails = null;
		try {

			BookDAO subjectDetailsDAO = new BookDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	@SuppressWarnings("unchecked")
	public List<Book> findBooksByCategory(int categoryId, Session session) throws HibernateException {
		List<Book> subjectDetails = null;
		try {

			BookDAO subjectDetailsDAO = new BookDAO(session);
			subjectDetails = subjectDetailsDAO.findByProperty("category.categoryId", categoryId);

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveBookDetail(Session session, Book subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Book subjectDetailsMerged = null;
		try {
			transaction.begin();
			BookDAO transactionDetailDAO = new BookDAO(session);
			subjectDetailsMerged = (Book) session.merge(subjectDetails);
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
	public boolean deleteBookDetail(Session session, Book subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			BookDAO transactionDetailDAO = new BookDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Book findByBookId(int subjectId, Session session)
			throws HibernateException {
		Book term = null;
		try {

			BookDAO termDAO = new BookDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}
	// -- start visitor

	@SuppressWarnings("unchecked")
	public List<StudentLendDetails> findAllStudentLendDetailss(Session session) throws HibernateException {
		List<StudentLendDetails> subjectDetails = null;
		try {

			StudentLendDetailsDAO subjectDetailsDAO = new StudentLendDetailsDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	@SuppressWarnings("unchecked")
	public List<StudentLendDetails> findByStudentId(int studentId, Session session) throws HibernateException {
		List<StudentLendDetails> subjectDetails = null;
		try {

			StudentLendDetailsDAO subjectDetailsDAO = new StudentLendDetailsDAO(session);
			subjectDetails = subjectDetailsDAO.findByProperty("studentDetails.studentId", studentId);

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveStudentLendDetailsDetail(Session session, StudentLendDetails subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		StudentLendDetails subjectDetailsMerged = null;
		try {
			transaction.begin();
			StudentLendDetailsDAO transactionDetailDAO = new StudentLendDetailsDAO(session);
			if(subjectDetails.getStatus().equals("ISSUED")){
				subjectDetails.setLendDate(DateUtils.getCurrentSysDate());
				subjectDetails.setReturnDate(null);
			}else if(subjectDetails.getStatus().equals("RETURNED")){
				subjectDetails.setReturnDate(DateUtils.getCurrentSysDate());
				subjectDetails.setLendDate(null);
			}
			subjectDetailsMerged = (StudentLendDetails) session.merge(subjectDetails);
			
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
	public boolean deleteStudentLendDetailsDetail(Session session, StudentLendDetails subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			StudentLendDetailsDAO transactionDetailDAO = new StudentLendDetailsDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public StudentLendDetails findByStudentLendDetailsId(int subjectId, Session session)
			throws HibernateException {
		StudentLendDetails term = null;
		try {

			StudentLendDetailsDAO termDAO = new StudentLendDetailsDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}
	
	@SuppressWarnings("unchecked")
	public List<StaffLendDetails> findAllStaffLendDetailss(Session session) throws HibernateException {
		List<StaffLendDetails> subjectDetails = null;
		try {

			StaffLendDetailsDAO subjectDetailsDAO = new StaffLendDetailsDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	@SuppressWarnings("unchecked")
	public List<StaffLendDetails> findByStaff(int staffId, Session session) throws HibernateException {
		List<StaffLendDetails> subjectDetails = null;
		try {

			StaffLendDetailsDAO subjectDetailsDAO = new StaffLendDetailsDAO(session);
			subjectDetails = subjectDetailsDAO.findByProperty("staffDetails.staffId", staffId);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveStaffLendDetailsDetail(Session session, StaffLendDetails subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		StaffLendDetails subjectDetailsMerged = null;
		try {
			transaction.begin();
			StaffLendDetailsDAO transactionDetailDAO = new StaffLendDetailsDAO(session);
			if(subjectDetails.getStatus().equals("ISSUED")){
				subjectDetails.setLendDate(DateUtils.getCurrentSysDate());
				subjectDetails.setReturnDate(null);
			}else if(subjectDetails.getStatus().equals("RETURNED")){
				subjectDetails.setReturnDate(DateUtils.getCurrentSysDate());
				subjectDetails.setLendDate(null);
			}
			subjectDetailsMerged = (StaffLendDetails) session.merge(subjectDetails);
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
	public boolean deleteStaffLendDetailsDetail(Session session, StaffLendDetails subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			StaffLendDetailsDAO transactionDetailDAO = new StaffLendDetailsDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public StaffLendDetails findByStaffLendDetailsId(int subjectId, Session session)
			throws HibernateException {
		StaffLendDetails term = null;
		try {

			StaffLendDetailsDAO termDAO = new StaffLendDetailsDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

}
