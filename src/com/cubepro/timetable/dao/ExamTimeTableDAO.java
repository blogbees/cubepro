package com.cubepro.timetable.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import com.cubepro.classes.ClassDetailsDAO;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.timetable.ExamTimeTable;
import com.cubepro.transaction.TransactionDetails;

public class ExamTimeTableDAO extends BaseHibernateDAO {
	
	private static final Log log = LogFactory.getLog(ExamTimeTableDAO.class);

	
	public ExamTimeTableDAO(Session session){
		super(session);
	}

	public void save(ExamTimeTable transientInstance) {
		log.debug("saving ExamTimeTable instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ExamTimeTable persistentInstance) {
		log.debug("deleting ExamTimeTable instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ExamTimeTable findById(java.lang.Integer id) {
		log.debug("getting ExamTimeTable instance with id: " + id);
		try {
			ExamTimeTable instance = (ExamTimeTable) session.get(
					"com.cubepro.timetable.ExamTimeTable", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ExamTimeTable instance) {
		log.debug("finding ExamTimeTable instance by example");
		try {
			List results = session.createCriteria("ExamTimeTable")
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
		log.debug("finding ExamTimeTable instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from com.cubepro.timetable.ExamTimeTable as model where model."
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
	public List<ExamTimeTable> findAll() {
		log.debug("finding all ExamTimeTable instances");
		try {
			Criteria queryObject = session.createCriteria(
					ExamTimeTable.class)
					.addOrder(Order.desc("examTimeTableId"));
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ExamTimeTable merge(ExamTimeTable detachedInstance) {
		log.debug("merging ExamTimeTable instance");
		try {
			ExamTimeTable result = (ExamTimeTable) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ExamTimeTable instance) {
		log.debug("attaching dirty ExamTimeTable instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ExamTimeTable instance) {
		log.debug("attaching clean ExamTimeTable instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

}
