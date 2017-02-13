package com.cubepro.components;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

public class ActionUtils {
	
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


}
