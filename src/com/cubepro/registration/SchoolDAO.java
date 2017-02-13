package com.cubepro.registration;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;


import com.cubepro.general.BaseHibernateDAO;

/**
 * Data access object (DAO) for domain model class ClassDetails.
 * 
 * @see ClassDetails
 * @author MyEclipse Persistence Tools
 */

public class SchoolDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(SchoolDAO.class);

	// property constants
	public static final String CLASS_NAME = "className";

	public static final String NO_OF_STUDENTS = "noOfStudents";

	public static final String SECTION_NAME = "sectionName";

	public static final String STAFF_IN_CHARGE_ID = "staffInChargeId";
	
	public SchoolDAO(Session session){
		super(session);
	}

	public void save(SchoolDetails transientInstance) {
		log.debug("saving SchoolDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SchoolDetails persistentInstance) {
		log.debug("deleting SchoolDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SchoolDetails findById(java.lang.Integer id) {
		log.debug("getting SchoolDetails instance with id: " + id);
		try {
			SchoolDetails instance = (SchoolDetails) session.get(
					"com.cubepro.classes.SchoolDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SchoolDetails instance) {
		log.debug("finding SchoolDetails instance by example");
		try {
			List results = session.createCriteria("SchoolDetails")
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
		log.debug("finding SchoolDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SchoolDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByClassName(Object className) {
		return findByProperty(CLASS_NAME, className);
	}

	public List findByNoOfStudents(Object noOfStudents) {
		return findByProperty(NO_OF_STUDENTS, noOfStudents);
	}

	public List findBySectionName(Object sectionName) {
		return findByProperty(SECTION_NAME, sectionName);
	}

	public List findByStaffInChargeId(Object staffInChargeId) {
		return findByProperty(STAFF_IN_CHARGE_ID, staffInChargeId);
	}

	@SuppressWarnings("unchecked")
	public List<SchoolDetails> findAll() {
		log.debug("finding all SchoolDetails instances");
		try {
			String queryString = "from com.cubepro.registration.SchoolDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SchoolDetails merge(SchoolDetails detachedInstance) {
		log.debug("merging SchoolDetails instance");
		try {
			SchoolDetails result = (SchoolDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SchoolDetails instance) {
		log.debug("attaching dirty SchoolDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SchoolDetails instance) {
		log.debug("attaching clean SchoolDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}