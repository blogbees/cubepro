package com.cubepro.components.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.RequestProcessor;

import com.cubepro.components.AbstractAction;
import com.cubepro.components.ActionUtils;
import com.cubepro.components.CubeProConstants;
import com.cubepro.general.components.Log;

public class CubeProRequestProcessor extends RequestProcessor {

	public static final String LOGIN_ACTION_PATH = "/Login";
	public static final String WELCOME_ACTION_PATH = "/Login";
	private static final String REQUEST_CHAR_ENC_UTF8 = "UTF8";
	private static final String RESPONSE_CONTENT_TYPE_TEXT_UTF8 = "text/html; charset=UTF-8";
	public static String LOCALE_CODE = "localeCode";

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try {
			super.process(request, response);
		} catch (final IOException e) {
			Log.error(getClass(), " IOException on process: ", e);
			throw e;
		} catch (final ServletException e) {
			Log.error(getClass(), " ServletException on process: ", e);
			throw e;
		} catch (final Throwable t) {
			Log.error(getClass(), " Exception on process: ", t);
			throw new ServletException(t);
		}
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.struts.action.RequestProcessor#processPreprocess(javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse) @return <code>true</code>
	 *      if the remainder of the standard processing should be performed , or
	 *      <code>false</code> if the response has already been created so the
	 *      calling method should immediately exit
	 */
	protected boolean processPreprocess(HttpServletRequest request, HttpServletResponse response) {
		String actionName = null;
		try {
			// Setting the character encoding should be the first line of the
			// method
			response.setContentType(RESPONSE_CONTENT_TYPE_TEXT_UTF8);
			// Set the encoding type to UTF-8 so as to support non-ascii
			// characters
			// received from html forms
			request.setCharacterEncoding(REQUEST_CHAR_ENC_UTF8);

			HttpSession httpSession = request.getSession(false);

			// This block added to invalidate the session if the EMuster URL is clicked when a user is already logged in 
			if ("true".equals(request.getParameter("login"))) {
				// if(!httpSession.isNew()) {
				httpSession.removeAttribute(CubeProConstants.ATTR_LOGIN_USER);
				httpSession.invalidate();
				httpSession = request.getSession(true);
				httpSession.setAttribute(Globals.LOCALE_KEY, request.getLocale());
				return true;
				// forwardToAction(request, response, "welcome");
				// return false; // do not continue with regular processing
				// }
			}

			actionName = processPath(request, response);
			
			Log.info(this.getClass(), "start preprocessing: " + actionName);

			ActionMapping mapping = processMapping(request, response, actionName);
			if (mapping == null) {
				throw new ServletException("The " + actionName
						+ " action does not have forward mapping, please check your struts-config file");
			}
			AbstractAction actionInstance = null;
			// If Forward is null no action instance will be found. 
			if (mapping.getForward() == null) {
				actionInstance = (AbstractAction) processActionCreate(request, response, mapping);
			} else {
				// Page is forwarded to jsp. Adding the session timeout message
				boolean validSession = AbstractAction.isValidSessionExists(request);
				if (validSession == false) {
					(new ActionUtils()).addMessage(request, "error.session.invalid");
					// This is added to show timeout error message
					response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
					// forwardToAction(request, response, "timeout");
					return false; // do not continue with regular processing

				}
				return true;
			}
			if (actionInstance == null) {
				throw new ServletException("Could not create an instance of the class that implements " + actionName);
			}

			// actionInstance.isLoggedInSessionRequired
			// actionInstance.isPublicPage

			// This block is added to check if session is expired.
			if (!(CubeProConstants.TRUE).equals(request.getParameter(CubeProConstants.PUBLIC_LOGIN))
					&& LOGIN_ACTION_PATH.equals(actionName) == false && WELCOME_ACTION_PATH.equals(actionName) == false) {
				boolean validSession = AbstractAction.isValidSessionExists(request);
				if (validSession == false && actionInstance.isLoggedInSessionRequired()) {
					actionInstance.addMessage(request, "error.session.invalid");
					forwardToAction(request, response, "timeout");
					return false; // do not continue with regular processing

				}
			} else
			{
				if (!AbstractAction.isValidSessionExists(request) && actionInstance.isPublicPage())	{
					//TODO: Redirect to page to show access denided to public user
				}
			}
		} catch (Exception e) {
			Log.error(this.getClass(), "presentation.error", e);
		}

		Log.info(this.getClass(), "end preprocessing: " + actionName);

		return true;
	}

	/**
	 * Forward to a page mapped in struts-config 
	 * @param request
	 * @param response
	 * @param forwardName
	 * @throws IOException
	 * @throws ServletException
	 */
	private void forwardToAction(HttpServletRequest request, HttpServletResponse response, String forwardName)
			throws IOException, ServletException {
		String sOriginActionName = processPath(request, response);

		ActionMapping mapping = processMapping(request, response, sOriginActionName);

		if (mapping == null)
			throw new ServletException("The mapping " + sOriginActionName
					+ " could not be found, please check your struts-config.xml file");

		// forward the action to given forward name ("timeout", or
		// "unauthorizedActionException")
		ActionForward actionForward = mapping.findForward(forwardName);

		if (actionForward != null) {
			// store origin action name in request - when forwarding to
			// UnauthorizedActionException
			if (forwardName.equals("UNAUTHORIZED_ACTION_EXCEPTION"))
				request.setAttribute("ACTION", sOriginActionName);

			// forward the control to the new action and don't perform the
			// request action
			processForwardConfig(request, response, actionForward);
		}
	}

}