package com.cubepro.hostel.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.exam.ExamDetails;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.hostel.Room;

/**
 * Data access object (DAO) for domain model class ExamDetails.
 * 
 * @see ExamDetails
 * @author MyEclipse Persistence Tools
 */

public class RoomDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(RoomDAO.class);

	public RoomDAO(Session session) {
		super(session);
	}

	public void save(Room transientInstance) {
		log.debug("saving Room instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Room persistentInstance) {
		log.debug("deleting Room instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Room findById(java.lang.Integer id) {
		log.debug("getting Room instance with id: " + id);
		try {
			Room instance = (Room) session.get("com.cubepro.hostel.Room", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Room instance) {
		log.debug("finding Room instance by example");
		try {
			List results = session.createCriteria("Room").add(
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
		log.debug("finding Room instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Room as model where model."
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
	public List<Room> findAll() {
		log.debug("finding all Room instances");
		try {
			String queryString = "from Room";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Room merge(Room detachedInstance) {
		log.debug("merging Room instance");
		try {
			Room result = (Room) session.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Room instance) {
		log.debug("attaching dirty Room instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Room instance) {
		log.debug("attaching clean Room instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}