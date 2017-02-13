package com.cubepro.transport.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.general.components.Log;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.transport.VehicleMaint;

/**
 * Data access object (DAO) for domain model class SubjectDetails.
 * 
 * @see SubjectDetails
 * @author MyEclipse Persistence Tools
 */

public class VehicleMaintDAO extends BaseHibernateDAO {

	public VehicleMaintDAO(Session session) {
		super(session);
	}

	@SuppressWarnings("unchecked")
	public void save(VehicleMaint transientInstance) {
		Log.debug(this.getClass(), "saving VehicleMaint instance");
		try {
			session.save(transientInstance);
			Log.debug(this.getClass(), "save successful");
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "save failed", re);
			throw re;
		}
	}

	public void delete(VehicleMaint persistentInstance) {
		Log.debug(this.getClass(), "deleting VehicleMaint instance");
		try {
			session.delete(persistentInstance);
			Log.debug(this.getClass(), "delete successful");
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "delete failed", re);
			throw re;
		}
	}

	public VehicleMaint findById(java.lang.Integer id) {
		Log.debug(this.getClass(), "getting VehicleMaint instance with id: "
				+ id);
		try {
			VehicleMaint instance = (VehicleMaint) session.get(
					"com.cubepro.transport.VehicleMaint", id);
			return instance;
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "get failed", re);
			throw re;
		}
	}

	public List findByExample(VehicleMaint instance) {
		Log.debug(this.getClass(), "finding VehicleMaint instance by example");
		try {
			List results = session.createCriteria("VehicleMaint").add(
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
				"finding VehicleMaint instance with property: " + propertyName
						+ ", value: " + value);
		try {
			String queryString = "from VehicleMaint as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "find by property name failed", re);
			throw re;
		}
	}

	public List findAllVehicleMaints() {
		Log.debug(this.getClass(), "finding all VehicleMaint instances");
		try {
			String queryString = "from VehicleMaint";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "find all failed", re);
			throw re;
		}
	}

	public VehicleMaint merge(VehicleMaint detachedInstance) {
		Log.debug(this.getClass(), "merging VehicleMaint instance");
		try {
			VehicleMaint result = (VehicleMaint) session
					.merge(detachedInstance);
			Log.debug(this.getClass(), "merge successful");
			return result;
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "merge failed", re);
			throw re;
		}
	}

	public void attachDirty(VehicleMaint instance) {
		Log.debug(this.getClass(), "attaching dirty VehicleMaint instance");
		try {
			session.saveOrUpdate(instance);
			Log.debug(this.getClass(), "attach successful");
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "attach failed", re);
			throw re;
		}
	}

	public void attachClean(VehicleMaint instance) {
		Log.debug(this.getClass(), "attaching clean VehicleMaint instance");
		try {
			session.lock(instance, LockMode.NONE);
			Log.debug(this.getClass(), "attach successful");
		} catch (RuntimeException re) {
			Log.error(this.getClass(), "attach failed", re);
			throw re;
		}
	}
}