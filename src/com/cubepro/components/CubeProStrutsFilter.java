package com.cubepro.components;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 * EMuster Filter class
 * 
 * @author kiruthika.vijayaraga
 *
 */
public class CubeProStrutsFilter implements Filter {

	private static final String REQUEST_CHAR_ENC_UTF8 = "UTF8";
	private static final String RESPONSE_CONTENT_TYPE_TEXT_UTF8 = "text/html; charset=UTF-8";
	public static final String LOGIN_ACTION_PATH = "/LoginSubmit";
	public static final String WELCOME_ACTION_PATH = "/Welcome";

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		// Setting the character encoding should be the first line of the method
		response.setContentType(RESPONSE_CONTENT_TYPE_TEXT_UTF8);
		// Set the encoding type to UTF-8 so as to support non-ascii characters
		// received from html forms
		request.setCharacterEncoding(REQUEST_CHAR_ENC_UTF8);

		// This block is added to check if session is expired.
		if(!(CubeProConstants.TRUE).equals(request.getParameter(CubeProConstants.PUBLIC_LOGIN)) && LOGIN_ACTION_PATH.equals(getPath(request))==false
				&& WELCOME_ACTION_PATH.equals(getPath(request))==false){
			boolean validSession = AbstractAction.isValidSessionExists(request);
			if(validSession == false){
				addMessage(request, "error.session.invalid");
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
				return;
			}
		}

		chain.doFilter(request, response);

	}
	
	private String getPath(HttpServletRequest request) {
		return request.getRequestURI().replace(request.getContextPath(), "").replace(".do", "");
	}

	/**
	 * Create and add an action message
	 * @param request
	 * @param message
	 */
	protected void addMessage(HttpServletRequest request, String key){
		ActionMessage message = new ActionMessage(key);
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
	 * get action messages
	 * @param request
	 */
    protected ActionMessages getMessages(HttpServletRequest request)
    {
        ActionMessages messages = (ActionMessages)request.getAttribute(ActionMessages.GLOBAL_MESSAGE);
        if(messages == null)
            messages = new ActionMessages();
        return messages;
    }

    /**
	 * save action messages
	 * @param request
	 * @param messages
	 */
    protected void saveMessages(HttpServletRequest request, ActionMessages messages)
    {
        if(messages == null || messages.isEmpty())
        {
            request.removeAttribute(ActionMessages.GLOBAL_MESSAGE);
            return;
        } else
        {
            request.setAttribute(ActionMessages.GLOBAL_MESSAGE, messages);
            return;
        }
    }

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(@SuppressWarnings("unused") FilterConfig fc) {
		//There are no init-param in the filter config as of now, no functionality is added here
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
		//There are no instance variables to clear now
	}
}