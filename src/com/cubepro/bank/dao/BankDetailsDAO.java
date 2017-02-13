package com.cubepro.bank.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import com.cubepro.bank.BankDetails;
import com.cubepro.classes.ClassDetails;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.transaction.AssetAndLiabilityDetails;

/**
 * Data access object (DAO) for domain model class SubjectDetails.
 * 
 * @see SubjectDetails
 * @author MyEclipse Persistence Tools
 */

public class BankDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(BankDetailsDAO.class);

	public BankDetailsDAO(Session session){
		super(session);
	}
	
	@SuppressWarnings("unchecked")
	public List<SubjectDetails> findByClass(ClassDetails classDetails) throws HibernateException {
		log.debug("finding BankDetails instance with property: classId"
				+ classDetails.getClassId());
		try {
			String queryString = "from BankDetails as model where ( model.classDetails.classId = ?)";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, classDetails.getClassId());
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}
	
	@SuppressWarnings("unchecked")
	public void save(BankDetails transientInstance) {
		log.debug("saving BankDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(BankDetails persistentInstance) {
		log.debug("deleting BankDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public BankDetails findById(java.lang.Integer id) {
		log.debug("getting BankDetails instance with id: " + id);
		try {
			BankDetails instance = (BankDetails) session.get(
					"com.cubepro.bank.BankDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(BankDetails instance) {
		log.debug("finding BankDetails instance by example");
		try {
			List results = session.createCriteria("BankDetails")
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
		log.debug("finding BankDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from BankDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all BankDetails instances");
		try {
			Criteria queryObject = session.createCriteria(
					BankDetails.class)
					.addOrder(Order.desc("id"));
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public BankDetails merge(BankDetails detachedInstance) {
		log.debug("merging BankDetails instance");
		try {
			BankDetails result = (BankDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(BankDetails instance) {
		log.debug("attaching dirty BankDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(BankDetails instance) {
		log.debug("attaching clean BankDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}