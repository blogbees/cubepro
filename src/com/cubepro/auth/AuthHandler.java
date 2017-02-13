package com.cubepro.auth;

import javax.servlet.http.HttpServletRequest;

/**
 * Common interface for authorization handlers in the application
 * 
 * @author prabakar.marimuthu
 *
 */
public interface AuthHandler {

	/**
	 * This method checks whether the logged in user has
	 * the required permission to perform the action in the 
	 * Emuster Application
	 * @param request
	 * @return
	 */
	public boolean checkAuthorization (HttpServletRequest request);
}
