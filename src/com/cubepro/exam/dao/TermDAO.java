package com.cubepro.exam.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.classes.ClassDetails;
import com.cubepro.exam.Term;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.subject.Subject;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.subject.dao.SubjectDetailsDAO;

/**
 * Data access object (DAO) for domain model class SubjectDetails.
 * 
 * @see SubjectDetails
 * @author MyEclipse Persistence Tools
 */

public class TermDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(TermDAO.class);

	// property constants
	public static final String SUBJECT_NAME = "subjectName";

	public static final String MAX_MARKS = "maxMarks";

	public TermDAO(Session session){
		super(session);
	}
	
	@SuppressWarnings("unchecked")
	public List<Subject> findByClass(ClassDetails classDetails) throws HibernateException {
		log.debug("finding Subject instance with property: classId"
				+ classDetails.getClassId());
		try {
			String queryString = "from Term as model where ( model.classDetails.classId = ?)";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, classDetails.getClassId());
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}
	
	@SuppressWarnings("unchecked")
	public void save(Term transientInstance) {
		log.debug("saving Term instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Term persistentInstance) {
		log.debug("deleting Term instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Term findById(java.lang.Integer id) {
		log.debug("getting Term instance with id: " + id);
		try {
			Term instance = (Term) session.get(
					"com.cubepro.exam.Term", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Term instance) {
		log.debug("finding Term instance by example");
		try {
			List results = session.createCriteria("Term")
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
		log.debug("finding Term instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Term as model where model."
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
		log.debug("finding all Term instances");
		try {
			String queryString = "from Term";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Term merge(Term detachedInstance) {
		log.debug("merging Term instance");
		try {
			Term result = (Term) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Term instance) {
		log.debug("attaching dirty Term instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Term instance) {
		log.debug("attaching clean Term instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}