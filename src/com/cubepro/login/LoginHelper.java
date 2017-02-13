package com.cubepro.login;

import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.components.CubeProConstants;
import com.cubepro.login.dao.LoginDetailsDAO;
import com.cubepro.login.entity.LoginDetails;
import com.cubepro.login.service.LoginService;
import com.cubepro.menu.CubeProMenuHandler;
import com.cubepro.menu.Menu;
import com.cubepro.roll.RolePermission;

public class LoginHelper {
	private static final Log LOG = LogFactory.getLog(LoginDetailsDAO.class);
	public boolean isValidUser(String userName, String passWord,
			HttpServletRequest request, Session session) throws HibernateException, GenericJDBCException,
			SQLException, FileNotFoundException {
		boolean status = false;
		try {
			LoginService loginService = new LoginService();
			HttpSession httpSession = request.getSession(true);
			List userDetails = loginService.getUserDetails(userName, passWord, session);
			if (userDetails != null && userDetails.isEmpty() == false) {
				status = true;
				request.getSession(true).removeAttribute(CubeProConstants.ATTR_LOGIN_USER);
				httpSession.setAttribute(CubeProConstants.ATTR_LOGIN_USER,
						userDetails.get(0));
				populateMenuForUser((LoginDetails)userDetails.get(0), httpSession, session);
			} else {
				status = false;
			}

		} catch (SQLException e) {
			LOG.error("EXCEption occured ...", e);
			throw e;
		}
		return status;
	}

	/**
	 * Gets all the permissions for the given user and populate the menu to be displayed
	 * and put it in session, while Logging in 
	 * @param user
	 * @return
	 */

	public void populateMenuForUser(LoginDetails user, HttpSession httpSession,Session session) {
		CubeProMenuHandler permissionHandler = new CubeProMenuHandler();
		
		// Fetch the available permissions for a user
		Set<RolePermission> permissions = new HashSet(0); 
		//Create role map
		Map<String, RolePermission> permissionsMap = new HashMap<String, RolePermission>(permissions.size());
		// Get menu object and put it in session
		Menu menu = permissionHandler.getAuthorizedMenu(permissionsMap, user.getUserId(),session);
		httpSession.setAttribute(CubeProConstants.ATTR_AUTHORIZED_MENU, menu);
	}
	
	public boolean saveLoginDetail(LoginDetails loginDetails,
			Session session) throws Exception {
		LoginService loginDetailsService = new LoginService();
		loginDetailsService.saveLoginDetails(session, loginDetails);
		return true;
	}

	public LoginDetails findByLoginId(int loginDetailsId, Session session)
			throws HibernateException {
		LoginDetails loginDetails = null;
		try {

			LoginService loginDetailsService = new LoginService();
			loginDetails = loginDetailsService.findByLoginDetailsId(Integer
					.valueOf(loginDetailsId), session);
		} catch (HibernateException e) {
			throw e;
		}
		return loginDetails;
	}
	
	public List<LoginDetails> findAll(Session session) throws HibernateException {
		List<LoginDetails> loginDetailss = null;
		try {
			LoginService loginService = new LoginService();
			loginDetailss = loginService.findAll(session);
		} catch (HibernateException e) {
			throw e;
		}
		return loginDetailss;
	}
}
