package com.cubepro.transaction.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.transaction.TransactionMaster;

public class TransactionMasterDAO extends BaseHibernateDAO{
	private static final Log log = LogFactory.getLog(TransactionMasterDAO.class);

	// property constants
	public static final String SUBJECT_NAME = "subjectName";

	public static final String MAX_MARKS = "maxMarks";

	public TransactionMasterDAO(Session session){
		super(session);
	}
	
	@SuppressWarnings("unchecked")
	public void save(TransactionMaster transientInstance) {
		log.debug("saving TransactionMaster instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TransactionMaster persistentInstance) {
		log.debug("deleting TransactionMaster instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TransactionMaster findById(java.lang.Integer id) {
		log.debug("getting TransactionMaster instance with id: " + id);
		try {
			TransactionMaster instance = (TransactionMaster) session.get(
					"com.cubepro.transaction.TransactionMaster", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List findByExample(TransactionMaster instance) {
		log.debug("finding TransactionMaster instance by example");
		try {
			List results = session.createCriteria("TransactionMaster")
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
		log.debug("finding TransactionMaster instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from TransactionMaster as model where model."
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
	public List findTransDesc(String type,String subType) {
		try {
			String queryString = "from TransactionMaster as model where model.type = ? and model.subType = ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, type);
			queryObject.setParameter(1, subType);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List findTransDesc(String subType) {
		try {
			String queryString = "from TransactionMaster as model where model.subType = ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, subType);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List getTransDescForBudget(String subType) {
		try {
			
			String queryString = "from TransactionMaster as model where (model.type = 'INCOME' or model.type = 'EXPENSE') and model.subType = ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, (subType==null || subType.trim().length()==0)?"MANAGEMENT A/C":subType);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	
	public List findAll() {
		log.debug("finding all TransactionMaster instances");
		try {
			String queryString = "from TransactionMaster";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TransactionMaster merge(TransactionMaster detachedInstance) {
		log.debug("merging TransactionMaster instance");
		try {
			TransactionMaster result = (TransactionMaster) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TransactionMaster instance) {
		log.debug("attaching dirty TransactionMaster instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TransactionMaster instance) {
		log.debug("attaching clean TransactionMaster instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}
