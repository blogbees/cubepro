package com.cubepro.student.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.exam.ExamDetails;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.student.StudentHomeWork;

/**
 * Data access object (DAO) for domain model class ExamDetails.
 * 
 * @see ExamDetails
 * @author MyEclipse Persistence Tools
 */

public class StudentHomeWorkDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(StudentHomeWorkDAO.class);

	public StudentHomeWorkDAO(Session session) {
		super(session);
	}

	public void save(StudentHomeWork transientInstance) {
		log.debug("saving StudentHomeWork instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StudentHomeWork persistentInstance) {
		log.debug("deleting StudentHomeWork instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StudentHomeWork findById(java.lang.Integer id) {
		log.debug("getting StudentHomeWork instance with id: " + id);
		try {
			StudentHomeWork instance = (StudentHomeWork) session.get("com.cubepro.student.StudentHomeWork", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StudentHomeWork instance) {
		log.debug("finding StudentHomeWork instance by example");
		try {
			List results = session.createCriteria("StudentHomeWork").add(
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
		log.debug("finding StudentHomeWork instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from StudentHomeWork as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<StudentHomeWork> findAll() {
		log.debug("finding all StudentHomeWork instances");
		try {
			String queryString = "from StudentHomeWork";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StudentHomeWork merge(StudentHomeWork detachedInstance) {
		log.debug("merging StudentHomeWork instance");
		try {
			StudentHomeWork result = (StudentHomeWork) session.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StudentHomeWork instance) {
		log.debug("attaching dirty StudentHomeWork instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StudentHomeWork instance) {
		log.debug("attaching clean StudentHomeWork instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}