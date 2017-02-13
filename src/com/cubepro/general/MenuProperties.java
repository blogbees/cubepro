package com.cubepro.general;

import java.util.ResourceBundle;

public class MenuProperties {
	
	private static ResourceBundle bundle;
	private static final String PROPERTIES_FILE_PATH = "menu";
	
	/*
	 * Private constructor to avoid instantiating the class
	 */
	private MenuProperties() {
		
	}
	
	/*
	 * Method to load the properties from the given properties file(permission.properties)
	 * 
	 */
	private static void loadProperties() {
		bundle = ResourceBundle.getBundle(PROPERTIES_FILE_PATH);
	}
	
	/**
	 * Method to get the value for the given key from the properties file
	 * 
	 * @param key - whose value needs to be retrieved
	 * @return - value that corresponds to the key
	 */
	public static String getProperty(String key) {
		
		if(bundle == null) {
			loadProperties();
		}
		return bundle.getString(key);
	}
	
}
