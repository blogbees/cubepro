package com.cubepro.homework.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.exam.ExamDetails;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.homework.HomeWork;

/**
 * Data access object (DAO) for domain model class ExamDetails.
 * 
 * @see ExamDetails
 * @author MyEclipse Persistence Tools
 */

public class HomeWorkDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(HomeWorkDAO.class);

	public HomeWorkDAO(Session session) {
		super(session);
	}

	public void save(HomeWork transientInstance) {
		log.debug("saving HomeWork instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(HomeWork persistentInstance) {
		log.debug("deleting HomeWork instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public HomeWork findById(java.lang.Integer id) {
		log.debug("getting HomeWork instance with id: " + id);
		try {
			HomeWork instance = (HomeWork) session.get("com.cubepro.homework.HomeWork", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(HomeWork instance) {
		log.debug("finding HomeWork instance by example");
		try {
			List results = session.createCriteria("HomeWork").add(
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
		log.debug("finding HomeWork instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from HomeWork as model where model."
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
	public List<HomeWork> findAll() {
		log.debug("finding all HomeWork instances");
		try {
			String queryString = "from HomeWork";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public HomeWork merge(HomeWork detachedInstance) {
		log.debug("merging HomeWork instance");
		try {
			HomeWork result = (HomeWork) session.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(HomeWork instance) {
		log.debug("attaching dirty HomeWork instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(HomeWork instance) {
		log.debug("attaching clean HomeWork instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}