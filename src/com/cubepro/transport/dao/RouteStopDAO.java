package com.cubepro.transport.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.transport.RouteStop;

/**
 * Data access object (DAO) for domain model class SubjectDetails.
 * 
 * @see SubjectDetails
 * @author MyEclipse Persistence Tools
 */

public class RouteStopDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(RouteStopDAO.class);

	// property constants
	public static final String SUBJECT_NAME = "subjectName";

	public static final String MAX_MARKS = "maxMarks";

	private static final String SQL_GET_TRANSPORT_DETAIL = "select rsm.route_stop_master_id, v.reg_name, v.reg_no, "
			+ " rm.route_id, rm.route_name,s.stop_name, rsm.stop_order from route_stop_master rsm , route_master rm, stop_master s, "
			+ " vehicle_master v where rsm.route_id = rm.route_id and rsm.stop_id = s.stop_id and rm.vehicle_id = v.vehicle_id "
			+ " group by rsm.route_stop_master_id, v.reg_name, v.reg_no,rm.route_id, rm.route_name, s.stop_name, rsm.stop_order "
			+ " order by v.vehicle_id, rm.route_id, rsm.stop_order";	
	public RouteStopDAO(Session session){
		super(session);
	}
	
	
	public void getTransportDetail(Session session) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		List<RouteStop> routeStopList = null;
		RouteStop routeStop = null;
		try{
			conn = session.connection();
			pstmt = conn.prepareStatement(SQL_GET_TRANSPORT_DETAIL);
			rst = pstmt.executeQuery();
			while(rst.next()){
				routeStop = new RouteStop();
				routeStop.getRoute().getVehicle().setRegName(rst.getString("regName"));
			}
		}catch(Exception e){
			log.error("get transport failed", e);
			throw e;
		}finally{
			try{
			rst.close();
			pstmt.close();
			conn.close();
			}catch(Exception e){}		
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public void save(RouteStop transientInstance) {
		log.debug("saving RouteStop instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(RouteStop persistentInstance) {
		log.debug("deleting RouteStop instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public RouteStop findById(java.lang.Integer id) {
		log.debug("getting RouteStop instance with id: " + id);
		try {
			RouteStop instance = (RouteStop) session.get(
					"com.cubepro.transport.RouteStop", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(RouteStop instance) {
		log.debug("finding RouteStop instance by example");
		try {
			List results = session.createCriteria("RouteStop")
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
		log.debug("finding RouteStop instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from RouteStop as model where model."
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
		log.debug("finding all RouteStop instances");
		try {
			String queryString = "from RouteStop";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public RouteStop merge(RouteStop detachedInstance) {
		log.debug("merging RouteStop instance");
		try {
			RouteStop result = (RouteStop) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(RouteStop instance) {
		log.debug("attaching dirty RouteStop instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(RouteStop instance) {
		log.debug("attaching clean RouteStop instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}