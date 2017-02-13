package com.cubepro.bank.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.bank.Bank;
import com.cubepro.classes.ClassDetails;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.subject.Subject;
import com.cubepro.subject.SubjectDetails;

/**
 * Data access object (DAO) for domain model class SubjectDetails.
 * 
 * @see SubjectDetails
 * @author MyEclipse Persistence Tools
 */

public class BankDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(BankDAO.class);

	public BankDAO(Session session){
		super(session);
	}
	
	@SuppressWarnings("unchecked")
	public List<Subject> findByClass(ClassDetails classDetails) throws HibernateException {
		log.debug("finding Bank instance with property: classId"
				+ classDetails.getClassId());
		try {
			String queryString = "from Bank as model where ( model.classDetails.classId = ?)";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, classDetails.getClassId());
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}
	
	@SuppressWarnings("unchecked")
	public void save(Bank transientInstance) {
		log.debug("saving Bank instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Bank persistentInstance) {
		log.debug("deleting Bank instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Bank findById(java.lang.Integer id) {
		log.debug("getting Bank instance with id: " + id);
		try {
			Bank instance = (Bank) session.get(
					"com.cubepro.bank.Bank", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Bank instance) {
		log.debug("finding Bank instance by example");
		try {
			List results = session.createCriteria("Bank")
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
		log.debug("finding Bank instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Bank as model where model."
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
		log.debug("finding all Bank instances");
		try {
			String queryString = "from Bank";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Bank merge(Bank detachedInstance) {
		log.debug("merging Bank instance");
		try {
			Bank result = (Bank) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Bank instance) {
		log.debug("attaching dirty Bank instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Bank instance) {
		log.debug("attaching clean Bank instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}