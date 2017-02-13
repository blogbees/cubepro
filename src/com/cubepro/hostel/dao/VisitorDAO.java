package com.cubepro.hostel.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.hostel.Visitor;

public class VisitorDAO  extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(VisitorDAO.class);

	public VisitorDAO(Session session) {
		super(session);
	}	

	public void save(Visitor transientInstance) {
		log.debug("saving Visitor instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Visitor persistentInstance) {
		log.debug("deleting Visitor instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Visitor findById(java.lang.Integer id) {
		log.debug("getting Visitor instance with id: " + id);
		try {
			Visitor instance = (Visitor) session.get("com.cubepro.hostel.Visitor", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Visitor instance) {
		log.debug("finding Visitor instance by example");
		try {
			List results = session.createCriteria("Visitor").add(
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
		log.debug("finding Visitor instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Visitor as model where model."
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
	public List<Visitor> findAll() {
		log.debug("finding all Visitor instances");
		try {
			String queryString = "from Visitor";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Visitor merge(Visitor detachedInstance) {
		log.debug("merging Visitor instance");
		try {
			Visitor result = (Visitor) session.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Visitor instance) {
		log.debug("attaching dirty Visitor instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Visitor instance) {
		log.debug("attaching clean Visitor instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

}
