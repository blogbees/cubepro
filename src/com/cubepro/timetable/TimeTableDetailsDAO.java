package com.cubepro.timetable;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;

/**
 * Data access object (DAO) for domain model class TimeTableDetails.
 * 
 * @see TimeTableDetails
 * @author MyEclipse Persistence Tools
 */

public class TimeTableDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(TimeTableDetailsDAO.class);

	// property constants
	public static final String DAY = "day";

	public static final String YEAR = "year";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";
	
	public TimeTableDetailsDAO(Session session){
		super(session);
	}

	public void save(TimeTableDetails transientInstance) {
		log.debug("saving TimeTableDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TimeTableDetails persistentInstance) {
		log.debug("deleting TimeTableDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TimeTableDetails findById(java.lang.Integer id) {
		log.debug("getting TimeTableDetails instance with id: " + id);
		try {
			TimeTableDetails instance = (TimeTableDetails) session.get(
					"TimeTableDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TimeTableDetails instance) {
		log.debug("finding TimeTableDetails instance by example");
		try {
			List results = session.createCriteria("TimeTableDetails")
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
		log.debug("finding TimeTableDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from TimeTableDetails as model where model."
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
	public List<TimeTableDetails> findByClassAndYear(int classId, int year) {
		log.debug("finding TimeTableDetails instance with property: "
				+ classId + ", year: " + year);
		try {
			String queryString = "from TimeTableDetails as model where model.classDetails.classId =  ? and year = ? ";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, classId);
			queryObject.setParameter(1, year);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDay(Object day) {
		return findByProperty(DAY, day);
	}

	public List findByYear(Object year) {
		return findByProperty(YEAR, year);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findAll() {
		log.debug("finding all TimeTableDetails instances");
		try {
			String queryString = "from TimeTableDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TimeTableDetails merge(TimeTableDetails detachedInstance) {
		log.debug("merging TimeTableDetails instance");
		try {
			TimeTableDetails result = (TimeTableDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TimeTableDetails instance) {
		log.debug("attaching dirty TimeTableDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TimeTableDetails instance) {
		log.debug("attaching clean TimeTableDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}