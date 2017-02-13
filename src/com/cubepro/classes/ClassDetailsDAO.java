package com.cubepro.classes;

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

public class ClassDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(ClassDetailsDAO.class);

	// property constants
	public static final String CLASS_NAME = "className";

	public static final String NO_OF_STUDENTS = "noOfStudents";

	public static final String SECTION_NAME = "sectionName";

	public static final String STAFF_IN_CHARGE_ID = "staffInChargeId";
	
	public ClassDetailsDAO(Session session){
		super(session);
	}

	public void save(ClassDetails transientInstance) {
		log.debug("saving ClassDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ClassDetails persistentInstance) {
		log.debug("deleting ClassDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ClassDetails findById(java.lang.Integer id) {
		log.debug("getting ClassDetails instance with id: " + id);
		try {
			ClassDetails instance = (ClassDetails) session.get(
					"com.cubepro.classes.ClassDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ClassDetails instance) {
		log.debug("finding ClassDetails instance by example");
		try {
			List results = session.createCriteria("ClassDetails")
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
		log.debug("finding ClassDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ClassDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<ClassDetails> getActiveClasses() {
		try {
			String queryString = "from ClassDetails as model where model.status = 'ACTIVE'";
			Query queryObject = session.createQuery(queryString);
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
	public List<ClassDetails> findAll() {
		log.debug("finding all ClassDetails instances");
		try {
			String queryString = "from ClassDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ClassDetails merge(ClassDetails detachedInstance) {
		log.debug("merging ClassDetails instance");
		try {
			ClassDetails result = (ClassDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ClassDetails instance) {
		log.debug("attaching dirty ClassDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ClassDetails instance) {
		log.debug("attaching clean ClassDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}