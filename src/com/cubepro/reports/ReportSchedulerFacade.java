/**
 * 
 */
package com.cubepro.reports;

import java.io.Serializable;
import java.net.URL;

import javax.xml.rpc.ServiceException;

/**
 * 
 *
 */
@SuppressWarnings("serial")
public class ReportSchedulerFacade extends
		com.jaspersoft.jasperserver.ws.scheduling.ReportSchedulerFacade implements Serializable {

	public ReportSchedulerFacade(URL address, String user, String password)
			throws ServiceException {
		super(address, user, password);
	}

}
