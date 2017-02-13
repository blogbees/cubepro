package com.cubepro.courses;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;

/**
 * Data access object (DAO) for domain model class CourseDetails.
 * 
 * @see CourseDetails
 * @author MyEclipse Persistence Tools
 */

public class CourseDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(CourseDetailsDAO.class);

	// property constants
	public static final String COURSE_NAME = "courseName";

	public static final String COURSE_FEE = "courseFee";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";

	public static final String STATUS = "status";

	public void save(CourseDetails transientInstance) {
		log.debug("saving CourseDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CourseDetails persistentInstance) {
		log.debug("deleting CourseDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CourseDetails findById(java.lang.Integer id) {
		log.debug("getting CourseDetails instance with id: " + id);
		try {
			CourseDetails instance = (CourseDetails) session.get(
					"CourseDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CourseDetails instance) {
		log.debug("finding CourseDetails instance by example");
		try {
			List results = session.createCriteria("CourseDetails")
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
		log.debug("finding CourseDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from CourseDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCourseName(Object courseName) {
		return findByProperty(COURSE_NAME, courseName);
	}

	public List findByCourseFee(Object courseFee) {
		return findByProperty(COURSE_FEE, courseFee);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all CourseDetails instances");
		try {
			String queryString = "from CourseDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CourseDetails merge(CourseDetails detachedInstance) {
		log.debug("merging CourseDetails instance");
		try {
			CourseDetails result = (CourseDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CourseDetails instance) {
		log.debug("attaching dirty CourseDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CourseDetails instance) {
		log.debug("attaching clean CourseDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}