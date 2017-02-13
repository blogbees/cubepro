package com.cubepro.library.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.library.StaffLendDetails;

public class StaffLendDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(StaffLendDetailsDAO.class);

	public StaffLendDetailsDAO(Session session) {
		super(session);
	}	

	public void save(StaffLendDetails transientInstance) {
		log.debug("saving StaffLendDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StaffLendDetails persistentInstance) {
		log.debug("deleting StaffLendDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StaffLendDetails findById(java.lang.Integer id) {
		log.debug("getting StaffLendDetails instance with id: " + id);
		try {
			StaffLendDetails instance = (StaffLendDetails) session.get("com.cubepro.library.StaffLendDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StaffLendDetails instance) {
		log.debug("finding StaffLendDetails instance by example");
		try {
			List results = session.createCriteria("StaffLendDetails").add(
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
		log.debug("finding StaffLendDetails instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from StaffLendDetails as model where model."
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
	public List<StaffLendDetails> findAll() {
		log.debug("finding all StaffLendDetails instances");
		try {
			String queryString = "from StaffLendDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StaffLendDetails merge(StaffLendDetails detachedInstance) {
		log.debug("merging StaffLendDetails instance");
		try {
			StaffLendDetails result = (StaffLendDetails) session.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StaffLendDetails instance) {
		log.debug("attaching dirty StaffLendDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StaffLendDetails instance) {
		log.debug("attaching clean StaffLendDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}


}
