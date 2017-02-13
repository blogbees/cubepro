package com.cubepro.menu.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.menu.MenuPermissions;
import com.cubepro.menu.Menus;
import com.cubepro.menu.dao.MenusDAO;
import com.cubepro.menu.dao.PermissionDAO;

public class PermissionService {

	@SuppressWarnings("unchecked")
	public List<Menus> findAllMenus(Session session) throws HibernateException {
		List<Menus> subjectDetails = null;
		try {

			MenusDAO subjectDetailsDAO = new MenusDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveMenusDetail(Session session, Menus subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Menus subjectDetailsMerged = null;
		try {
			transaction.begin();
			MenusDAO transactionDetailDAO = new MenusDAO(session);
			subjectDetailsMerged = (Menus) session.merge(subjectDetails);
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
	public boolean deleteMenusDetail(Session session, Menus subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			MenusDAO transactionDetailDAO = new MenusDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Menus findByMenusId(int subjectId, Session session)
			throws HibernateException {
		Menus term = null;
		try {
			MenusDAO termDAO = new MenusDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

	@SuppressWarnings("unchecked")
	public List<MenuPermissions> findAllMenuPermissionss(Session session)
			throws HibernateException {
		List<MenuPermissions> subjectDetails = null;
		try {

			PermissionDAO subjectDetailsDAO = new PermissionDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveMenuPermissionsDetail(Session session,
			MenuPermissions subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		MenuPermissions subjectDetailsMerged = null;
		try {
			transaction.begin();
			PermissionDAO transactionDetailDAO = new PermissionDAO(session);
			subjectDetailsMerged = (MenuPermissions) session
					.merge(subjectDetails);
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
	public boolean deleteMenuPermissionsDetail(Session session,
			MenuPermissions subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			PermissionDAO transactionDetailDAO = new PermissionDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public MenuPermissions findByMenuPermissionsId(int subjectId,
			Session session) throws HibernateException {
		MenuPermissions term = null;
		try {

			PermissionDAO termDAO = new PermissionDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}
	
	public List<MenuPermissions> findByLoginId(int userId,
			Session session) throws HibernateException {
		List<MenuPermissions> term = null;
		try {

			PermissionDAO termDAO = new PermissionDAO(session);
			term = termDAO.findByLoginId(userId);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

}
