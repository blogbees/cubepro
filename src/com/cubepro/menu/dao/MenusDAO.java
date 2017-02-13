package com.cubepro.menu.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.menu.Menus;

public class MenusDAO extends BaseHibernateDAO{
	private static final Log log = LogFactory.getLog(MenusDAO.class);


	public MenusDAO(Session session){
		super(session);
	}
	
	public void save(Menus transientInstance) {
		log.debug("saving Menus instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Menus persistentInstance) {
		log.debug("deleting Menus instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Menus findById(java.lang.Integer id) {
		log.debug("getting Menus instance with id: " + id);
		try {
			Menus instance = (Menus) session.get(
					"com.cubepro.menu.Menus", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Menus instance) {
		log.debug("finding Menus instance by example");
		try {
			List results = session.createCriteria("Menus").add(
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
		log.debug("finding Menus instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Menus as model where model."
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
	public List<Menus> findAll() {
		log.debug("finding all Menus instances");
		try {
			String queryString = "from Menus";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Menus merge(Menus detachedInstance) {
		log.debug("merging Menus instance");
		try {
			Menus result = (Menus) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Menus instance) {
		log.debug("attaching dirty Menus instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Menus instance) {
		log.debug("attaching clean Menus instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

}
