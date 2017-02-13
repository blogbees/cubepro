package com.cubepro.staff.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.components.CubeProConstants;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.staff.StaffDetails;
import com.cubepro.student.StudentDetails;

/**
 * Data access object (DAO) for domain model class StaffDetails.
 * 
 * @see StaffDetails
 * @author MyEclipse Persistence Tools
 */

public class StaffDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(StaffDetailsDAO.class);

	// property constants
	public static final String STAFF_NAME = "firstName";

	public static final String STAFF_NO = "staffNo";

	public static final String FATHER_NAME = "fatherName";

	public static final String MOTHER_NAME = "motherName";

	public static final String GUARDIAN_NAME = "guardianName";

	public static final String ADDRESS1 = "address1";

	public static final String ADDRESS2 = "address2";

	public static final String CITY = "city";

	public static final String STATE = "state";

	public static final String COUNTRY = "country";

	public static final String ZIP_CODE = "zipCode";

	public static final String PHONE = "phone";

	public static final String MOBILE = "mobile";

	public static final String SALARY_AMOUNT = "salaryAmount";

	public static final String SEX = "sex";

	public static final String QUALIFICATION = "qualification";

	public static final String DESIGNATION = "designation";

	public static final String SUBJECT_HANDLED1 = "subjectHandled1";

	public static final String SUBJECT_HANDLED2 = "subjectHandled2";

	public static final String SUBJECT_HANDLED3 = "subjectHandled3";

	public static final String SUBJECT_HANDLED4 = "subjectHandled4";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";

	public static final String STATUS_ID = "statusId";
	
	public StaffDetailsDAO(Session session){
		super(session);
	}

	public void save(StaffDetails transientInstance) {
		log.debug("saving StaffDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StaffDetails persistentInstance) {
		log.debug("deleting StaffDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StaffDetails findById(java.lang.Integer id) {
		log.debug("getting StaffDetails instance with id: " + id);
		try {
			StaffDetails instance = (StaffDetails) session.get(
					"com.cubepro.staff.StaffDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StaffDetails instance) {
		log.debug("finding StaffDetails instance by example");
		try {
			List results = session.createCriteria("com.cubepro.staff.StudentDetails")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding StaffDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from StaffDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByStaffName(Object staffName) {
		return findByProperty(STAFF_NAME, staffName);
	}

	public List findByStaffNo(Object staffNo) {
		return findByProperty(STAFF_NO, staffNo);
	}

	public List findByFatherName(Object fatherName) {
		return findByProperty(FATHER_NAME, fatherName);
	}

	public List findByMotherName(Object motherName) {
		return findByProperty(MOTHER_NAME, motherName);
	}

	public List findByGuardianName(Object guardianName) {
		return findByProperty(GUARDIAN_NAME, guardianName);
	}

	public List findByAddress1(Object address1) {
		return findByProperty(ADDRESS1, address1);
	}

	public List findByAddress2(Object address2) {
		return findByProperty(ADDRESS2, address2);
	}

	public List findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List findByState(Object state) {
		return findByProperty(STATE, state);
	}

	public List findByCountry(Object country) {
		return findByProperty(COUNTRY, country);
	}

	public List findByZipCode(Object zipCode) {
		return findByProperty(ZIP_CODE, zipCode);
	}

	public List findByPhone(Object phone) {
		return findByProperty(PHONE, phone);
	}

	public List findByMobile(Object mobile) {
		return findByProperty(MOBILE, mobile);
	}

	public List findBySalaryAmount(Object salaryAmount) {
		return findByProperty(SALARY_AMOUNT, salaryAmount);
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findByQualification(Object qualification) {
		return findByProperty(QUALIFICATION, qualification);
	}

	public List findByDesignation(Object designation) {
		return findByProperty(DESIGNATION, designation);
	}

	public List findBySubjectHandled1(Object subjectHandled1) {
		return findByProperty(SUBJECT_HANDLED1, subjectHandled1);
	}

	public List findBySubjectHandled2(Object subjectHandled2) {
		return findByProperty(SUBJECT_HANDLED2, subjectHandled2);
	}

	public List findBySubjectHandled3(Object subjectHandled3) {
		return findByProperty(SUBJECT_HANDLED3, subjectHandled3);
	}

	public List findBySubjectHandled4(Object subjectHandled4) {
		return findByProperty(SUBJECT_HANDLED4, subjectHandled4);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findByStatusId(Object statusId) {
		return findByProperty(STATUS_ID, statusId);
	}

	public List findAll() {
		log.debug("finding all StaffDetails instances");
		try {
			String queryString = "from StaffDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StaffDetails merge(StaffDetails detachedInstance) {
		log.debug("merging StaffDetails instance");
		try {
			StaffDetails result = (StaffDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StaffDetails instance) {
		log.debug("attaching dirty StaffDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StaffDetails instance) {
		log.debug("attaching clean StaffDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StaffDetails> getStaffList(StaffDetails staffDetails) throws Exception {
		log.debug("finding StaffDetails instance with property: "
				+ staffDetails.getFirstName() + ", rollNo: " + staffDetails.getStaffNo());
		try {
			String queryString = "from StaffDetails as model ";

			String whereQuery =" where 1=1 "; 
			if (staffDetails.getFirstName() != null
					&& staffDetails.getFirstName().trim().length() > 0)
				whereQuery += " and model.firstName like ? ";
			if (staffDetails.getStaffNo() != null
					&& staffDetails.getStaffNo().trim().length() > 0)
				whereQuery += " and model.staffNo like ? ";
			if (staffDetails.getDobString() != null
					&& staffDetails.getDobString().trim().length() > 0)
				whereQuery += " and model.dobString = ? ";
			if (staffDetails.getDept() != null
					&& staffDetails.getDept().trim().length() > 0)			
				whereQuery += " and model.dept like ? ";
			if (staffDetails.getDesignation() != null
					&& staffDetails.getDesignation().trim().length() > 0)			
				whereQuery += " and model.designation like ? ";
			queryString += whereQuery;
			Query queryObject = session.createQuery(queryString);
			int i = 0;
			if (staffDetails.getFirstName() != null
					&& staffDetails.getFirstName().trim().length() > 0)
			queryObject.setParameter(i++, staffDetails.getFirstName()+CubeProConstants.CHAR_PERCENTAGE);
			if (staffDetails.getStaffNo() != null
					&& staffDetails.getStaffNo().trim().length() > 0)
			queryObject.setParameter(i++, CubeProConstants.CHAR_PERCENTAGE+staffDetails.getStaffNo()+CubeProConstants.CHAR_PERCENTAGE);
			if (staffDetails.getDobString() != null
					&& staffDetails.getDobString().trim().length() > 0)
			queryObject.setParameter(i++, staffDetails.getDobString());
			if (staffDetails.getDept() != null
					&& staffDetails.getDept().trim().length() > 0)			
			queryObject.setParameter(i++, CubeProConstants.CHAR_PERCENTAGE+staffDetails.getDept()+CubeProConstants.CHAR_PERCENTAGE);
			if (staffDetails.getDesignation() != null
					&& staffDetails.getDesignation().trim().length() > 0)			
			queryObject.setParameter(i++, CubeProConstants.CHAR_PERCENTAGE+staffDetails.getDesignation()+CubeProConstants.CHAR_PERCENTAGE);
			
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}

}