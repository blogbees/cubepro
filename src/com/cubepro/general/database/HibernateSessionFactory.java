package com.cubepro.general.database;

import com.cubepro.general.components.Log;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

/**
 * Configures and provides access to Hibernate sessions, tied to the
 * current thread of execution.  Follows the Thread Local Session
 * pattern, see {@link http://hibernate.org/42.html }.
 */
public class HibernateSessionFactory {

	/**
	 * Location of hibernate.cfg.xml file.
	 * Location should be on the classpath as Hibernate uses
	 * #resourceAsStream style lookup for its configuration file.
	 * The default classpath location of the hibernate config file is
	 * in the default package. Use #setConfigFile() to update
	 * the location of the configuration file for the current session.
	 */
	private static final String CONFIG_FILE_LOCATION = "/hibernate.cfg.xml";
	private static final ThreadLocal<Map<String,Session>> THREAD_LOCAL = new ThreadLocal<Map<String,Session>>();
	
	private static Configuration cubeproDbConfiguration = new Configuration();
	
	private static org.hibernate.SessionFactory cubeproDbSessionFactory;
	
	private static String cubeproDbConfigFile = CONFIG_FILE_LOCATION;

	private static String CUBEPRO_DB_SESSION_ID = "CUBEPRO";
	
	private HibernateSessionFactory() {
		// Should  not access from outside
	}

	/**
	 * Returns the ThreadLocal Session instance.  Lazy initialize
	 * the <code>SessionFactory</code> if needed.
	 *
	 *  @return Session
	 *  @throws HibernateException
	 */
	public static Session getSession() throws FileNotFoundException, HibernateException {
		if(THREAD_LOCAL.get()==null){
			THREAD_LOCAL.set(new HashMap<String, Session>());
		}
		Session session = THREAD_LOCAL.get().get(CUBEPRO_DB_SESSION_ID);

		if (session == null || !session.isOpen()) {
			if (cubeproDbSessionFactory == null) {
				rebuildCubeProDbSessionFactory();
			}
			session = (cubeproDbSessionFactory != null) ? cubeproDbSessionFactory.openSession() : null;
			THREAD_LOCAL.get().put(CUBEPRO_DB_SESSION_ID, session);
			Log.debug(HibernateSessionFactory.class, " opened a new eshakthiDB session for t-" + Thread.currentThread().getName() + 
					", session-" + (session==null?null:session.hashCode()));
		}
		Log.debug(HibernateSessionFactory.class, " returning eshakthiDB session for t-" + Thread.currentThread().getName() + 
				", session-" + (session==null?null:session.hashCode()));
		return session;
	}


	/**
	 *  Rebuild hibernate session factory
	 *
	 */
	public static void rebuildCubeProDbSessionFactory() throws FileNotFoundException, HibernateException {
		Log.debug(HibernateSessionFactory.class, " Building CubePro Session Factory from " + cubeproDbConfigFile);
		cubeproDbConfiguration.configure(new File(cubeproDbConfigFile));
		cubeproDbSessionFactory = cubeproDbConfiguration.buildSessionFactory();
		Log.debug(HibernateSessionFactory.class, " CubePro Session Factory built sucessfully");
	}


	/**
	 *  Close the single hibernate session instance.
	 *
	 *  @throws HibernateException
	 */
	public static void closeSession() throws HibernateException {
		if(THREAD_LOCAL.get()==null){
			Log.debug(HibernateSessionFactory.class, " There are no cubepro hibernate sessions to close");
			return;
		}
		Session session = THREAD_LOCAL.get().get(CUBEPRO_DB_SESSION_ID);
		THREAD_LOCAL.get().put(CUBEPRO_DB_SESSION_ID, null);
		
		if (session != null) {
			session.close();
			session = null;
			Log.debug(HibernateSessionFactory.class, " successfully closed cubeproDB session for t-" + Thread.currentThread().getName() + 
					", session-" + (session==null?null:session.hashCode()));
		}
	}

	public static void closeSessions() throws HibernateException {
		if(THREAD_LOCAL.get()==null){
			Log.debug(HibernateSessionFactory.class, " There are no hibernate sessions to close");
			return;
		}
		closeSession();
		
	}


	/**
	 *  return session factory
	 *
	 *	session factory will be rebuilded in the next call
	 */
	public static void setCubeproDbConfigFile(String cubeproDbConfigFile) {
		HibernateSessionFactory.cubeproDbConfigFile = cubeproDbConfigFile;
		cubeproDbSessionFactory = null;
	}

	public static org.hibernate.SessionFactory getCubeproDbSessionFactory() {
		return cubeproDbSessionFactory;
	}

	public static void setCubeproDbSessionFactory(
			org.hibernate.SessionFactory cubeproDbSessionFactory) {
		HibernateSessionFactory.cubeproDbSessionFactory = cubeproDbSessionFactory;
	}
	



}