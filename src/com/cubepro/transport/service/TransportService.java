package com.cubepro.transport.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.transport.Route;
import com.cubepro.transport.RouteStop;
import com.cubepro.transport.Stop;
import com.cubepro.transport.Vehicle;
import com.cubepro.transport.VehicleFuel;
import com.cubepro.transport.VehicleMaint;
import com.cubepro.transport.dao.RouteDAO;
import com.cubepro.transport.dao.RouteStopDAO;
import com.cubepro.transport.dao.StopDAO;
import com.cubepro.transport.dao.VehicleDAO;
import com.cubepro.transport.dao.VehicleFuelDAO;
import com.cubepro.transport.dao.VehicleMaintDAO;

public class TransportService {

	@SuppressWarnings("unchecked")
	public List<Vehicle> findAllVehicles(Session session)
			throws HibernateException {
		List<Vehicle> subjectDetails = null;
		try {

			VehicleDAO subjectDetailsDAO = new VehicleDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveVehicleDetail(Session session, Vehicle subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Vehicle subjectDetailsMerged = null;
		try {
			transaction.begin();
			VehicleDAO transactionDetailDAO = new VehicleDAO(session);
			subjectDetailsMerged = (Vehicle) session.merge(subjectDetails);
			transactionDetailDAO.save(subjectDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	/**
	 * @param session
	 * @param subjectDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteVehicleDetail(Session session, Vehicle subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			VehicleDAO transactionDetailDAO = new VehicleDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Vehicle findByVehicleId(int subjectId, Session session)
			throws HibernateException {
		Vehicle term = null;
		try {

			VehicleDAO termDAO = new VehicleDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

	@SuppressWarnings("unchecked")
	public List<Route> findAllRoutes(Session session) throws HibernateException {
		List<Route> subjectDetails = null;
		try {

			RouteDAO subjectDetailsDAO = new RouteDAO(session);
			subjectDetails = subjectDetailsDAO.findAllRoutes();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveRouteDetail(Session session, Route subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Route subjectDetailsMerged = null;
		try {
			transaction.begin();
			RouteDAO transactionDetailDAO = new RouteDAO(session);
			subjectDetailsMerged = (Route) session.merge(subjectDetails);
			transactionDetailDAO.save(subjectDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	/**
	 * @param session
	 * @param subjectDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteRouteDetail(Session session, Route subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			RouteDAO transactionDetailDAO = new RouteDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Route findByRouteId(int subjectId, Session session)
			throws HibernateException {
		Route term = null;
		try {

			RouteDAO termDAO = new RouteDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

	@SuppressWarnings("unchecked")
	public List<Stop> findAllStops(Session session) throws HibernateException {
		List<Stop> subjectDetails = null;
		try {

			StopDAO subjectDetailsDAO = new StopDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveStopDetail(Session session, Stop subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Stop subjectDetailsMerged = null;
		try {
			transaction.begin();
			StopDAO transactionDetailDAO = new StopDAO(session);
			subjectDetailsMerged = (Stop) session.merge(subjectDetails);
			transactionDetailDAO.save(subjectDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	/**
	 * @param session
	 * @param subjectDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteStopDetail(Session session, Stop subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			StopDAO transactionDetailDAO = new StopDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Stop findByStopId(int subjectId, Session session)
			throws HibernateException {
		Stop term = null;
		try {

			StopDAO termDAO = new StopDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

	@SuppressWarnings("unchecked")
	public List<RouteStop> findAllRouteStops(Session session)
			throws HibernateException {
		List<RouteStop> subjectDetails = null;
		try {

			RouteStopDAO subjectDetailsDAO = new RouteStopDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveRouteStopDetail(Session session, RouteStop subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		RouteStop subjectDetailsMerged = null;
		try {
			transaction.begin();
			RouteStopDAO routeStopDAO = new RouteStopDAO(session);
			subjectDetailsMerged = (RouteStop) session.merge(subjectDetails);
			routeStopDAO.save(subjectDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	/**
	 * @param session
	 * @param subjectDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteRouteStopDetail(Session session,
			RouteStop subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			RouteStopDAO transactionDetailDAO = new RouteStopDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public RouteStop findByRouteStopId(int subjectId, Session session)
			throws HibernateException {
		RouteStop term = null;
		try {

			RouteStopDAO termDAO = new RouteStopDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

	/** ***********************************************Maint************************************** */
	@SuppressWarnings("unchecked")
	public List<VehicleMaint> findAllVehicleMaints(Session session)
			throws HibernateException {
		List<VehicleMaint> subjectDetails = null;
		try {

			VehicleMaintDAO subjectDetailsDAO = new VehicleMaintDAO(session);
			subjectDetails = subjectDetailsDAO.findAllVehicleMaints();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveVehicleMaintDetail(Session session,
			VehicleMaint subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		VehicleMaint subjectDetailsMerged = null;
		try {
			transaction.begin();
			VehicleMaintDAO transactionDetailDAO = new VehicleMaintDAO(session);
			subjectDetailsMerged = (VehicleMaint) session.merge(subjectDetails);
			transactionDetailDAO.save(subjectDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	/**
	 * @param session
	 * @param subjectDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteVehicleMaintDetail(Session session,
			VehicleMaint subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			VehicleMaintDAO transactionDetailDAO = new VehicleMaintDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public VehicleMaint findByVehicleMaintId(int subjectId, Session session)
			throws HibernateException {
		VehicleMaint term = null;
		try {

			VehicleMaintDAO termDAO = new VehicleMaintDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

	@SuppressWarnings("unchecked")
	public List<VehicleFuel> findAllVehicleFuels(Session session)
			throws HibernateException {
		List<VehicleFuel> subjectDetails = null;
		try {

			VehicleFuelDAO subjectDetailsDAO = new VehicleFuelDAO(session);
			subjectDetails = subjectDetailsDAO.findAllVehicleFuels();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveVehicleFuelDetail(Session session,
			VehicleFuel subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		VehicleFuel subjectDetailsMerged = null;
		try {
			transaction.begin();
			VehicleFuelDAO transactionDetailDAO = new VehicleFuelDAO(session);
			subjectDetailsMerged = (VehicleFuel) session.merge(subjectDetails);
			transactionDetailDAO.save(subjectDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	/**
	 * @param session
	 * @param subjectDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteVehicleFuelDetail(Session session,
			VehicleFuel subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			VehicleFuelDAO transactionDetailDAO = new VehicleFuelDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public VehicleFuel findByVehicleFuelId(int subjectId, Session session)
			throws HibernateException {
		VehicleFuel term = null;
		try {

			VehicleFuelDAO termDAO = new VehicleFuelDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

}
