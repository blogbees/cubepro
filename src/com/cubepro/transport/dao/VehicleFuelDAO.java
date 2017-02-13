package com.cubepro.transport.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.general.components.Log;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.transport.VehicleFuel;

/**
 * Data access object (DAO) for domain model class SubjectDetails.
 * 
 * @see SubjectDetails
 * @author MyEclipse Persistence Tools
 */

public class VehicleFuelDAO extends BaseHibernateDAO {

	public VehicleFuelDAO(Session session) {
		super(session);
	}

	@SuppressWarnings("unchecked")
	public void save(VehicleFuel transientInstance) {
		Log.debug(this.getClass(), "saving VehicleFuel instance");
		try {
			session.save(transientInstance);
			Log.debug(this.getClass(), "save successful");
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "save failed", re);
			throw re;
		}
	}

	public void delete(VehicleFuel persistentInstance) {
		Log.debug(this.getClass(), "deleting VehicleFuel instance");
		try {
			session.delete(persistentInstance);
			Log.debug(this.getClass(), "delete successful");
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "delete failed", re);
			throw re;
		}
	}

	public VehicleFuel findById(java.lang.Integer id) {
		Log.debug(this.getClass(), "getting VehicleFuel instance with id: "
				+ id);
		try {
			VehicleFuel instance = (VehicleFuel) session.get(
					"com.cubepro.transport.VehicleFuel", id);
			return instance;
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "get failed", re);
			throw re;
		}
	}

	public List findByExample(VehicleFuel instance) {
		Log.debug(this.getClass(), "finding VehicleFuel instance by example");
		try {
			List results = session.createCriteria("VehicleFuel").add(
					Example.create(instance)).list();
			Log.debug(this.getClass(),
					"find by example successful, result size: "
							+ results.size());
			return results;
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		Log.debug(this.getClass(),
				"finding VehicleFuel instance with property: " + propertyName
						+ ", value: " + value);
		try {
			String queryString = "from VehicleFuel as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "find by property name failed", re);
			throw re;
		}
	}

	public List findAllVehicleFuels() {
		Log.debug(this.getClass(), "finding all VehicleFuel instances");
		try {
			String queryString = "from VehicleFuel";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "find all failed", re);
			throw re;
		}
	}

	public VehicleFuel merge(VehicleFuel detachedInstance) {
		Log.debug(this.getClass(), "merging VehicleFuel instance");
		try {
			VehicleFuel result = (VehicleFuel) session
					.merge(detachedInstance);
			Log.debug(this.getClass(), "merge successful");
			return result;
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "merge failed", re);
			throw re;
		}
	}

	public void attachDirty(VehicleFuel instance) {
		Log.debug(this.getClass(), "attaching dirty VehicleFuel instance");
		try {
			session.saveOrUpdate(instance);
			Log.debug(this.getClass(), "attach successful");
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "attach failed", re);
			throw re;
		}
	}

	public void attachClean(VehicleFuel instance) {
		Log.debug(this.getClass(), "attaching clean VehicleFuel instance");
		try {
			session.lock(instance, LockMode.NONE);
			Log.debug(this.getClass(), "attach successful");
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "attach failed", re);
			throw re;
		}
	}
}