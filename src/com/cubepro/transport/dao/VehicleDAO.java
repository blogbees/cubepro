package com.cubepro.transport.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.exam.ExamDetails;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.transport.Vehicle;

/**
 * Data access object (DAO) for domain model class ExamDetails.
 * 
 * @see ExamDetails
 * @author MyEclipse Persistence Tools
 */

public class VehicleDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(VehicleDAO.class);

	// property constants
	public static final String EXAM_TYPE = "examType";

	public static final String SUBJECT_NAME = "subjectName";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";

	public VehicleDAO(Session session){
		super(session);
	}
	
	public void save(Vehicle transientInstance) {
		log.debug("saving Vehicle instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Vehicle persistentInstance) {
		log.debug("deleting Vehicle instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Vehicle findById(java.lang.Integer id) {
		log.debug("getting Vehicle instance with id: " + id);
		try {
			Vehicle instance = (Vehicle) session.get(
					"com.cubepro.transport.Vehicle", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Vehicle instance) {
		log.debug("finding Vehicle instance by example");
		try {
			List results = session.createCriteria("Vehicle").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Vehicle instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Vehicle as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<Vehicle> findByClassId(Integer classId) {
		try {
			String queryString = "from Vehicle as model where model.classDetails.classId = ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, classId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByExamType(Object examType) {
		return findByProperty(EXAM_TYPE, examType);
	}

	public List findBySubjectName(Object subjectName) {
		return findByProperty(SUBJECT_NAME, subjectName);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	@SuppressWarnings("unchecked")
	public List<Vehicle> findAll() {
		log.debug("finding all Vehicle instances");
		try {
			String queryString = "from Vehicle";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Vehicle merge(Vehicle detachedInstance) {
		log.debug("merging Vehicle instance");
		try {
			Vehicle result = (Vehicle) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Vehicle instance) {
		log.debug("attaching dirty Vehicle instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Vehicle instance) {
		log.debug("attaching clean Vehicle instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}