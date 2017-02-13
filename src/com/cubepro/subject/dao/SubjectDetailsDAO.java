package com.cubepro.subject.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.classes.ClassDetails;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.subject.SubjectDetails;

/**
 * Data access object (DAO) for domain model class SubjectDetails.
 * 
 * @see SubjectDetails
 * @author MyEclipse Persistence Tools
 */

public class SubjectDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(SubjectDetailsDAO.class);

	// property constants
	public static final String SUBJECT_NAME = "subjectName";

	public static final String MAX_MARKS = "maxMarks";

	public SubjectDetailsDAO(Session session){
		super(session);
	}
	
	@SuppressWarnings("unchecked")
	public List<SubjectDetails> findByClass(ClassDetails classDetails) throws HibernateException {
		log.debug("finding SubjectDetails instance with property: classId"
				+ classDetails.getClassId());
		try {
			String queryString = "from SubjectDetails as model where ( model.classDetails.classId = ?)";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, classDetails.getClassId());
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}
	
	@SuppressWarnings("unchecked")
	public void save(SubjectDetails transientInstance) {
		log.debug("saving SubjectDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SubjectDetails persistentInstance) {
		log.debug("deleting SubjectDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SubjectDetails findById(java.lang.Integer id) {
		log.debug("getting SubjectDetails instance with id: " + id);
		try {
			SubjectDetails instance = (SubjectDetails) session.get(
					"com.cubepro.subject.SubjectDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SubjectDetails instance) {
		log.debug("finding SubjectDetails instance by example");
		try {
			List results = session.createCriteria("SubjectDetails")
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
		log.debug("finding SubjectDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SubjectDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySubjectName(Object subjectName) {
		return findByProperty(SUBJECT_NAME, subjectName);
	}

	public List findByMaxMarks(Object maxMarks) {
		return findByProperty(MAX_MARKS, maxMarks);
	}

	public List findAll() {
		log.debug("finding all SubjectDetails instances");
		try {
			String queryString = "from SubjectDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SubjectDetails merge(SubjectDetails detachedInstance) {
		log.debug("merging SubjectDetails instance");
		try {
			SubjectDetails result = (SubjectDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SubjectDetails instance) {
		log.debug("attaching dirty SubjectDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SubjectDetails instance) {
		log.debug("attaching clean SubjectDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}