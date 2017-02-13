package com.cubepro.library.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.library.StudentLendDetails;

public class StudentLendDetailsDAO  extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(StudentLendDetailsDAO.class);

	public StudentLendDetailsDAO(Session session) {
		super(session);
	}	

	public void save(StudentLendDetails transientInstance) {
		log.debug("saving StudentLendDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StudentLendDetails persistentInstance) {
		log.debug("deleting StudentLendDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StudentLendDetails findById(java.lang.Integer id) {
		log.debug("getting StudentLendDetails instance with id: " + id);
		try {
			StudentLendDetails instance = (StudentLendDetails) session.get("com.cubepro.library.StudentLendDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StudentLendDetails instance) {
		log.debug("finding StudentLendDetails instance by example");
		try {
			List results = session.createCriteria("StudentLendDetails").add(
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
		log.debug("finding StudentLendDetails instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from StudentLendDetails as model where model."
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
	public List<StudentLendDetails> findAll() {
		log.debug("finding all StudentLendDetails instances");
		try {
			String queryString = "from StudentLendDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StudentLendDetails merge(StudentLendDetails detachedInstance) {
		log.debug("merging StudentLendDetails instance");
		try {
			StudentLendDetails result = (StudentLendDetails) session.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StudentLendDetails instance) {
		log.debug("attaching dirty StudentLendDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StudentLendDetails instance) {
		log.debug("attaching clean StudentLendDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

}
