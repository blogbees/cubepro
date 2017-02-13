package com.cubepro.transaction.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.transaction.AssetAndLiabilityDetails;

public class AssetAndLiabilityDAO extends BaseHibernateDAO{

	private static final Log log = LogFactory.getLog(AssetAndLiabilityDAO.class);
	
	public AssetAndLiabilityDAO(Session session){
		super(session);
	}
	

	public void save(AssetAndLiabilityDetails transientInstance) {
		log.debug("saving AssetAndLiabilityDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(AssetAndLiabilityDetails persistentInstance) {
		log.debug("deleting AssetAndLiabilityDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AssetAndLiabilityDetails findById(java.lang.Integer id) {
		log.debug("getting AssetAndLiabilityDetails instance with id: " + id);
		try {
			AssetAndLiabilityDetails instance = (AssetAndLiabilityDetails) session.get(
					"com.cubepro.transaction.AssetAndLiabilityDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(AssetAndLiabilityDetails instance) {
		log.debug("finding AssetAndLiabilityDetails instance by example");
		try {
			List results = session.createCriteria("AssetAndLiabilityDetails")
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
		log.debug("finding AssetAndLiabilityDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from com.cubepro.timetable.AssetAndLiabilityDetails as model where model."
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
	public List<AssetAndLiabilityDetails> findAll() {
		log.debug("finding all AssetAndLiabilityDetails instances");
		try {
			Criteria queryObject = session.createCriteria(
					AssetAndLiabilityDetails.class)
					.addOrder(Order.desc("assAndLiaId"));
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
    
	@SuppressWarnings("unchecked")
	public List<AssetAndLiabilityDetails> findAllBudget() {
		log.debug("finding all BudgetDetails instances");
		try {
			Criteria queryObject = session.createCriteria(
					AssetAndLiabilityDetails.class)
					.addOrder(Order.desc("assAndLiaId"));
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public AssetAndLiabilityDetails merge(AssetAndLiabilityDetails detachedInstance) {
		log.debug("merging AssetAndLiabilityDetails instance");
		try {
			AssetAndLiabilityDetails result = (AssetAndLiabilityDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(AssetAndLiabilityDetails instance) {
		log.debug("attaching dirty AssetAndLiabilityDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AssetAndLiabilityDetails instance) {
		log.debug("attaching clean AssetAndLiabilityDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}



}
