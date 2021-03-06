package com.cubepro.menu.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.exam.ExamDetails;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.menu.MenuPermissions;

/**
 * Data access object (DAO) for domain model class ExamDetails.
 * 
 * @see ExamDetails
 * @author MyEclipse Persistence Tools
 */

public class PermissionDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(PermissionDAO.class);


	public PermissionDAO(Session session){
		super(session);
	}
	
	public void save(MenuPermissions transientInstance) {
		log.debug("saving MenuPermissions instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(MenuPermissions persistentInstance) {
		log.debug("deleting MenuPermissions instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public MenuPermissions findById(java.lang.Integer id) {
		log.debug("getting MenuPermissions instance with id: " + id);
		try {
			MenuPermissions instance = (MenuPermissions) session.get(
					"com.cubepro.menu.MenuPermissions", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(MenuPermissions instance) {
		log.debug("finding MenuPermissions instance by example");
		try {
			List results = session.createCriteria("MenuPermissions").add(
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
		log.debug("finding MenuPermissions instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from MenuPermissions as model where model."
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
	public List findByLoginId(int userId) {
		try {
			String queryString = "from MenuPermissions as model where model.loginDetails.userId = ? ";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, userId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}	
	@SuppressWarnings("unchecked")
	public List<MenuPermissions> findAll() {
		log.debug("finding all MenuPermissions instances");
		try {
			String queryString = "from MenuPermissions";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public MenuPermissions merge(MenuPermissions detachedInstance) {
		log.debug("merging MenuPermissions instance");
		try {
			MenuPermissions result = (MenuPermissions) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(MenuPermissions instance) {
		log.debug("attaching dirty MenuPermissions instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(MenuPermissions instance) {
		log.debug("attaching clean MenuPermissions instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}