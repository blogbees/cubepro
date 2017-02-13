package com.cubepro.fees.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import com.cubepro.classes.ClassDetails;
import com.cubepro.fees.FeesMaster;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.subject.Subject;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.subject.dao.SubjectDAO;


/**
 * Data access object (DAO) for domain model class SubjectDetails.
 * 
 * @see SubjectDetails
 * @author MyEclipse Persistence Tools
 */

public class FeesDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(SubjectDAO.class);

	// property constants
	public static final String SUBJECT_NAME = "subjectName";

	public static final String MAX_MARKS = "maxMarks";

	public FeesDAO(Session session){
		super(session);
	}
	
	@SuppressWarnings("unchecked")
	public List<Subject> findByClass(ClassDetails classDetails) throws HibernateException {
		log.debug("finding Fees instance with property: classId"
				+ classDetails.getClassId());
		try {
			String queryString = "from Fees as model where ( model.classDetails.classId = ?)";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, classDetails.getClassId());
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}
	
	@SuppressWarnings("unchecked")
	public void save(FeesMaster transientInstance) {
		log.debug("saving FeesMaster instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(FeesMaster persistentInstance) {
		log.debug("deleting FeesMaster instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public FeesMaster findById(java.lang.Integer id) {
		log.debug("getting FeesMaster instance with id: " + id);
		try {
			FeesMaster instance = (FeesMaster) session.get(
					"com.cubepro.fees.FeesMaster", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(FeesMaster instance) {
		log.debug("finding FeesMaster instance by example");
		try {
			List results = session.createCriteria("FeesMaster")
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
		log.debug("finding FeesMaster instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from FeesMaster as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<FeesMaster> getDistinctFeesType(Connection conn, int classId) throws Exception{
			List<FeesMaster> feesMasterList = new ArrayList<FeesMaster>();
			ResultSet rs = null;
			PreparedStatement st = null;
		try {
			String queryString = "select distinct fees_type from fees_master where status = 'ACTIVE' and class_id = ? order by id";
			st = conn.prepareStatement(queryString);
			st.setInt(1, classId);
			rs = st.executeQuery();
			FeesMaster feesMaster = null;
			while(rs.next()){
				feesMaster = new FeesMaster();
				feesMaster.setFeesType(rs.getString("fees_type"));
				feesMasterList.add(feesMaster);
			}
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}finally{
			if(rs!=null)
				rs.close();
				if(st!=null)
				st.close();
		}
		return feesMasterList;
	}
	
	public List<FeesMaster> getDistinctFeesSubType(Connection conn, String feesType, int classId) throws Exception{
		List<FeesMaster> feesMasterList = new ArrayList<FeesMaster>();
		ResultSet rs = null;
		PreparedStatement st = null;
	try {
		String queryString = "select distinct fees_name, fees_amt from fees_master where fees_type = ? and class_id = ? and status = 'ACTIVE' order by id";
		st = conn.prepareStatement(queryString);
		st.setString(1, feesType);
		st.setInt(2, classId);
		rs = st.executeQuery();
		FeesMaster feesMaster = null;
		while(rs.next()){
			feesMaster = new FeesMaster();
			feesMaster.setFeesName(rs.getString("fees_name"));
			feesMaster.setFeesAmt(rs.getString("fees_amt"));
			feesMasterList.add(feesMaster);
		}
	} catch (RuntimeException re) {
		log.error("find by property name failed", re);
		throw re;
	}finally{
		if(rs!=null)
		rs.close();
		if(st!=null)
		st.close();
	}
	return feesMasterList;
}


	public List findAll() {
		log.debug("finding all FeesMaster instances");
		try {
			Criteria queryObject = session.createCriteria(
					FeesMaster.class)
					.addOrder(Order.desc("id"));
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public FeesMaster merge(FeesMaster detachedInstance) {
		log.debug("merging FeesMaster instance");
		try {
			FeesMaster result = (FeesMaster) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(FeesMaster instance) {
		log.debug("attaching dirty FeesMaster instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(FeesMaster instance) {
		log.debug("attaching clean FeesMaster instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}