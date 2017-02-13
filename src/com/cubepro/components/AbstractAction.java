package com.cubepro.components;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.Globals;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.util.MessageResources;

import com.cubepro.components.enums.LocaleEnum;
import com.cubepro.login.entity.LoginDetails;

/**
 * This class is the abstract implementation of Struts Action class. All the
 * requests to the EMuster web application will be routed through this class.
 * 
 * The pre-business logic activities such as session & permission verifications are
 * handled in this class.
 * 
 * @author prabakar.marimuthu
 *
 */
public abstract class AbstractAction extends Action  {
	
	public static final String LOGIN_ACTION_PATH = "/Login";
	public static final String WELCOME_ACTION_PATH = "/Login";
	
	public static MessageResources messageResources = null;

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping,
	 *      org.apache.struts.action.ActionForm,
	 *      javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//Lazy initialize the message resources
		if(messageResources == null){
			//Read the resources from request set by the ActionServlet
			//This will be used by the DWRHelper
			//This object will be a singleton object
			messageResources = getResources(request);
		}
		
		if(!(CubeProConstants.TRUE).equals(request.getParameter(CubeProConstants.PUBLIC_LOGIN))) {
			// Verify the existence of valid session
			if (LOGIN_ACTION_PATH.equals(mapping.getPath())==false
					&& WELCOME_ACTION_PATH.equals(mapping.getPath())==false && !isValidSessionExists(request)) {
				addMessage(request, "error.session.invalid");
				return mapping.findForward("timeout");
			}
			
			if (LOGIN_ACTION_PATH.equals(mapping.getPath())==false
					&& WELCOME_ACTION_PATH.equals(mapping.getPath())==false && !checkAuthorization(request)
					) {
				addError(request, "error.action.unauthorized");
				return mapping.findForward("unauthorized");
			}
		}
		
		
		
		ActionForward result = this.processRequest(mapping, form, request, response);
		
		return result;
	}

	/**
	 * The action classes for screens should implement this method and check
	 * the permission, the user needs to have to perform the action. This method
	 * returns true when there no permissions are required for a jscreen.
	 * @param user TODO
	 * 
	 * @return
	 */
	//public abstract boolean isAccessible (LoginDetails user); 
	/**
	 * This method handles the request and executes the business logic
	 * by calling one or more business classes
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public abstract ActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	/**
	 * Get the Locale object of the current user session
	 * @param request
	 * @return
	 */
	public static Locale getUserSessionLocale(HttpServletRequest request){
		return (Locale)request.getSession().getAttribute(Globals.LOCALE_KEY);
	}
	
	/**
	 * Get the language code of the current user session
	 * @param request
	 * @return
	 */
	public static String getUserSessionLanguageCode(HttpServletRequest request){
		return getUserSessionLocale(request).getLanguage();
	}
	
	/**
	 * Get the LocaleEnum that corresponds to the current user session
	 * @param request
	 * @return
	 */
	public static LocaleEnum getUserSessionLocaleEnum(HttpServletRequest request){
		return LocaleEnum.getValue(getUserSessionLanguageCode(request));
	}
	
	
	/**
	 * Checks whether the current user is already logged in
	 * to the application.
	 * 
	 * @return
	 */
	public static boolean isValidSessionExists (HttpServletRequest request) {
		Integer userId = getLoginUserId(request.getSession());
		//Valid session should contain a emuster user object with userId
		if(userId == null){
			return false;
		}
		return true;
	}

	
	/**
	 * Get the user object from the current session
	 * 
	 * This method is static because, this method may be accessed from DWR classes
	 * 
	 * @param httpSession
	 * @return
	 */
	public static LoginDetails getLoginUser(HttpSession httpSession){
		LoginDetails user = (LoginDetails)httpSession.getAttribute(CubeProConstants.ATTR_LOGIN_USER);
		return user;
	}
	
	/**
	 * Get the userId from the current logged-in user
	 * 
	 * This method is static because, this method may be accessed from DWR classes
	 * 
	 * @param httpSession
	 * @return
	 */
	public static Integer getLoginUserId(HttpSession httpSession){
		Integer userId = null;
		LoginDetails user = getLoginUser(httpSession);
		if(user != null){
			userId = user.getUserId();
		}
		return userId;
	}
	
	/* (non-Javadoc)
	 * @see com.cubepro.auth.AuthHandler#checkAuthorization(HttpServletRequest request)
	 */
	@SuppressWarnings("unchecked")
	public boolean checkAuthorization(@SuppressWarnings("unused") HttpServletRequest request) {
		LoginDetails user = getLoginUser(request.getSession());
		return true;//isAccessible(user);
	}
		
	/**
	 * Create and add an action message
	 * @param request
	 * @param message
	 */
	public void addMessage(HttpServletRequest request, String key){
		ActionMessage message = new ActionMessage(key);
		addMessage(request, message);
	}

	/**
	 * Create and add an action message
	 * @param request
	 * @param message
	 */
	protected void addMessage(HttpServletRequest request, String key, Object arg1){
		ActionMessage message = new ActionMessage(key, arg1);
		addMessage(request, message);
	}
	
	/**
	 * Add an action message
	 * @param request
	 * @param message
	 */
	protected void addMessage(HttpServletRequest request, ActionMessage message){
		boolean firstMessage = false;
		ActionMessages messages = getMessages(request);
		if(messages!=null){
			if(messages.isEmpty()){
				firstMessage = true;
			}
			messages.add(ActionMessages.GLOBAL_MESSAGE, message);
		}
		if(firstMessage){
			//Messages could be saved only if it is non-empty
			saveMessages(request, messages);
		}
	}
	
	/**
	 * Create and add an action error
	 * @param request
	 * @param error
	 */
	protected void addError(HttpServletRequest request, String key){
		
		addError(request, key, ActionMessages.GLOBAL_MESSAGE);
	}

	/**
	 * Add an action error
	 * @param request - HttpServletRequest object 
	 * @param errorMessageKey - Key to retrieve the message from resource bundle
	 * @param errorKey - key used to display the error message in jsp page, using html:messages tag
	 */
	protected void addError(HttpServletRequest request, String errorMessageKey, String errorKey) {
		
		boolean firstError = false;
		ActionMessage error = new ActionMessage(errorMessageKey);
		ActionMessages errors = getErrors(request);
		if(errors!=null){
			if(errors.isEmpty()){
				firstError = true;
			}
			errors.add(errorKey, error);
		}
		if(firstError){
			//Errors could be saved only if it is non-empty
			saveErrors(request, errors);
		}
	}
	
	/**
	 * Checks whether login is required.It is true for all Secured Pages
	 * If it is a non secure page it should be overridden
	 * 
	 * @return
	 */
	public boolean isLoggedInSessionRequired() {
		return true;
	}
	
	/**
	 * To check if the page can be accessible by public or not
	 * Return true if the page is accessible by public
	 * 
	 * @return
	 */
	public boolean isPublicPage() {
		return false;
	}

}