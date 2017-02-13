package com.cubepro.fees.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.fees.FeesDetails;
import com.cubepro.general.BaseHibernateDAO;

/**
 * Data access object (DAO) for domain model class FeesDetails.
 * 
 * @see FeesDetails
 * @author MyEclipse Persistence Tools
 */

public class FeesDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(FeesDetailsDAO.class);

	// property constants
	public static final String FEES_AMOUNT = "feesAmount";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";
	
	public FeesDetailsDAO(Session session){
		super(session);
	}

	public void save(FeesDetails transientInstance) {
		log.debug("saving FeesDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(FeesDetails persistentInstance) {
		log.debug("deleting FeesDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public FeesDetails findById(java.lang.Integer id) {
		log.debug("getting FeesDetails instance with id: " + id);
		try {
			FeesDetails instance = (FeesDetails) session.get(
					"FeesDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(FeesDetails instance) {
		log.debug("finding FeesDetails instance by example");
		try {
			List results = session.createCriteria("FeesDetails").add(
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
		log.debug("finding FeesDetails instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from FeesDetails as model where model."
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
	public List<FeesDetails> getFeesDetails(int classId) {
		try {
			String queryString = "from com.cubepro.fees.FeesDetails as model where model.classDetails.classId = ? ";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, classId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}


	public List findByFeesAmount(Object feesAmount) {
		return findByProperty(FEES_AMOUNT, feesAmount);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findAll() {
		log.debug("finding all FeesDetails instances");
		try {
			String queryString = "from FeesDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public FeesDetails merge(FeesDetails detachedInstance) {
		log.debug("merging FeesDetails instance");
		try {
			FeesDetails result = (FeesDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(FeesDetails instance) {
		log.debug("attaching dirty FeesDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(FeesDetails instance) {
		log.debug("attaching clean FeesDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}