package com.cubepro.general.components;

import org.apache.log4j.Logger;

/**
 * Most logging operations, except configuration, are done through this class
 *  
 * @author yasmin.matharussain
 *
 */
public class Log{
	
	/**
	 * This method is used to log a message object with the INFO level.     
	 * @param clazz
	 * @param obj
	 */
	final public static  void info(Class<?> clazz, Object  obj){
	      Logger log = Logger.getLogger(clazz.getName());
	      log.info(obj);
	}
	
	/**
	 * This method is used to log a message object with DEBUG level.    
	 * @param clazz
	 * @param obj
	 */
	final public static void debug(Class<?> clazz, Object obj){
		Logger log = Logger.getLogger(clazz.getName());
		log.debug(obj);
	}
	
	/**
	 * 	 This method is used to log a message object with WARN level.    
	 * @param clazz
	 * @param obj
	 */
	final public static void warn(Class<?> clazz, Object obj){
		Logger log = Logger.getLogger(clazz.getName());
		log.warn(obj);
	}
	
	/**
	 *  This method is used to log a message object with FATAL level.
	 * @param clazz
	 * @param obj
	 */
	final public static void fatal(Class<?> clazz, Object obj){
		Logger log = Logger.getLogger(clazz.getName());
		log.fatal(obj);		
	}
	
	/**
	 * This method is used to log a message object with the ERROR level including the stack trace of the Exception e passed as parameter. 
	 * @param clazz
	 * @param obj
	 * @param e
	 */
	final public static void error(Class<?> clazz, Object obj, Throwable e){
		Logger log = Logger.getLogger(clazz.getName());
		log.error(obj,e);
	}
	
}