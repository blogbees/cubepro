package com.cubepro.staff.attendance.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.attendance.StaffAttendanceDetails;

/**
 * Data access object (DAO) for domain model class StaffAttendanceDetails.
 * 
 * @see StaffAttendanceDetails
 * @author MyEclipse Persistence Tools
 */

public class StaffAttendanceDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory
			.getLog(StaffAttendanceDetailsDAO.class);

	// property constants
	public static final String STAFF_ID = "staffId";

	public static final String ATTENDANCE_STATUS = "attendanceStatus";

	public static final String ATTENDANCE_REASON = "attendanceReason";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";

	public StaffAttendanceDetailsDAO(Session session){
		super(session);
	}
	public void save(StaffAttendanceDetails transientInstance) {
		log.debug("saving StaffAttendanceDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StaffAttendanceDetails persistentInstance) {
		log.debug("deleting StaffAttendanceDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StaffAttendanceDetails findById(java.lang.Integer id) {
		log.debug("getting StaffAttendanceDetails instance with id: " + id);
		try {
			StaffAttendanceDetails instance = (StaffAttendanceDetails) session
					.get("com.cubepro.staff.attendance.StaffAttendanceDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StaffAttendanceDetails instance) {
		log.debug("finding StaffAttendanceDetails instance by example");
		try {
			List results = session.createCriteria(
					"StaffAttendanceDetails")
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
		log.debug("finding StaffAttendanceDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from StaffAttendanceDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByStaffId(Object staffId) {
		return findByProperty(STAFF_ID, staffId);
	}

	public List findByAttendanceStatus(Object attendanceStatus) {
		return findByProperty(ATTENDANCE_STATUS, attendanceStatus);
	}

	public List findByAttendanceReason(Object attendanceReason) {
		return findByProperty(ATTENDANCE_REASON, attendanceReason);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findAll() {
		log.debug("finding all StaffAttendanceDetails instances");
		try {
			String queryString = "from StaffAttendanceDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StaffAttendanceDetails merge(StaffAttendanceDetails detachedInstance) {
		log.debug("merging StaffAttendanceDetails instance");
		try {
			StaffAttendanceDetails result = (StaffAttendanceDetails) session
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StaffAttendanceDetails instance) {
		log.debug("attaching dirty StaffAttendanceDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StaffAttendanceDetails instance) {
		log.debug("attaching clean StaffAttendanceDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StaffAttendanceDetails> getStaffAttendanceList(StaffDetails staffDetails, String attendanceDateString) throws Exception {
		log.debug("finding StaffAttendanceDetails instance with property: "
				+ staffDetails.getFirstName() + ", rollNo: " + staffDetails.getStaffNo());
		try {
			String queryString = "from StaffAttendanceDetails as model where ( model.staffDetails.firstName like ? or model.staffDetails.staffNo like ? or model.staffDetails.dept like ?) and model.attendanceDate = ? ";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, staffDetails.getFirstName());
			queryObject.setParameter(1, staffDetails.getStaffNo());
			queryObject.setParameter(2, staffDetails.getDept());
			queryObject.setParameter(3, attendanceDateString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}

}