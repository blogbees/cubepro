package com.cubepro.general.plugin;

import com.cubepro.general.components.Log;
import com.cubepro.general.database.HibernateSessionFactory;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
import org.hibernate.HibernateException;
import org.hibernate.MappingException;

/**
 * Implements the <code>PlugIn</code> interface to configure the Hibernate
 * data persistence library.
 * 
 */
public class HibernatePlugin implements PlugIn {
	/**
	 * Initializes the <code>SessionFactory</code>.
	 * 
	 * @param servlet
	 *            the <code>ActionServlet</code> instance under which the
	 *            plugin will run.
	 * @param config
	 *            the <code>ModuleConfig</code> for the module under which the
	 *            plugin will run.
	 */

	public void init(ActionServlet servlet, ModuleConfig modConfig)
			throws ServletException {
		try {
			Log.debug(getClass(), " Building Hibernate Session Factories ");
			// load the static session factory.
			String appPath = servlet.getServletContext().getRealPath("");

			HibernateSessionFactory.setCubeproDbConfigFile(appPath
					+ cubeproDbConfigFile);
			HibernateSessionFactory.rebuildCubeProDbSessionFactory();

			Log.debug(getClass(),
					" Hibernate Session Factories sucessfully built");

		} catch (final MappingException e) {
			Log.error(getClass(), " hibernate mapping error", e);
			throw new ServletException(e);
		} catch (final HibernateException e) {
			Log.error(getClass(), " hibernate error", e);
			throw new ServletException(e);
		} catch (final Exception e) {
			Log.error(getClass(), " general error", e);
			throw new ServletException(e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.struts.action.PlugIn#destroy()
	 */
	public void destroy() {
		try {
			HibernateSessionFactory.closeSessions();
		} catch (HibernateException e) {
			Log.error(getClass(), " Unable to close sessions", e);
		}
	}

	private String cubeproDbConfigFile;

	public String getCubeproDbConfigFile() {
		return cubeproDbConfigFile;
	}

	public void setCubeproDbConfigFile(String cubeproDbConfigFile) {
		this.cubeproDbConfigFile = cubeproDbConfigFile;
	}

}
