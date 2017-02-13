package com.cubepro.hostel.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.hostel.BuildingInf;
import com.cubepro.hostel.Room;
import com.cubepro.hostel.Visitor;
import com.cubepro.hostel.dao.BuildingInfDAO;
import com.cubepro.hostel.dao.RoomDAO;
import com.cubepro.hostel.dao.VisitorDAO;

public class HostelService {

	@SuppressWarnings("unchecked")
	public List<BuildingInf> findAllBuildingInfs(Session session)
			throws HibernateException {
		List<BuildingInf> subjectDetails = null;
		try {

			BuildingInfDAO subjectDetailsDAO = new BuildingInfDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveBuildingInfDetail(Session session,
			BuildingInf subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		BuildingInf subjectDetailsMerged = null;
		try {
			transaction.begin();
			BuildingInfDAO transactionDetailDAO = new BuildingInfDAO(session);
			subjectDetailsMerged = (BuildingInf) session.merge(subjectDetails);
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
	public boolean deleteBuildingInfDetail(Session session,
			BuildingInf subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			BuildingInfDAO transactionDetailDAO = new BuildingInfDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public BuildingInf findByBuildingInfId(int subjectId, Session session)
			throws HibernateException {
		BuildingInf term = null;
		try {

			BuildingInfDAO termDAO = new BuildingInfDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

	@SuppressWarnings("unchecked")
	public List<Room> findAllRooms(Session session) throws HibernateException {
		List<Room> subjectDetails = null;
		try {

			RoomDAO subjectDetailsDAO = new RoomDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveRoomDetail(Session session, Room subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Room subjectDetailsMerged = null;
		try {
			transaction.begin();
			RoomDAO transactionDetailDAO = new RoomDAO(session);
			subjectDetailsMerged = (Room) session.merge(subjectDetails);
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
	public boolean deleteRoomDetail(Session session, Room subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			RoomDAO transactionDetailDAO = new RoomDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Room findByRoomId(int subjectId, Session session)
			throws HibernateException {
		Room term = null;
		try {

			RoomDAO termDAO = new RoomDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}
	// -- start visitor
	
	@SuppressWarnings("unchecked")
	public List<Visitor> findAllVisitors(Session session) throws HibernateException {
		List<Visitor> subjectDetails = null;
		try {

			VisitorDAO subjectDetailsDAO = new VisitorDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveVisitorDetail(Session session, Visitor subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Visitor subjectDetailsMerged = null;
		try {
			transaction.begin();
			VisitorDAO transactionDetailDAO = new VisitorDAO(session);
			subjectDetailsMerged = (Visitor) session.merge(subjectDetails);
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
	public boolean deleteVisitorDetail(Session session, Visitor subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			VisitorDAO transactionDetailDAO = new VisitorDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Visitor findByVisitorId(int subjectId, Session session)
			throws HibernateException {
		Visitor term = null;
		try {

			VisitorDAO termDAO = new VisitorDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

}
