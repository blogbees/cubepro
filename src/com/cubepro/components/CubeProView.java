package com.cubepro.components;

import java.text.DateFormat;

/**
 * Abstract view object. This class holds the common 
 * data required for many web pages.
 * 
 * @author prabakar.marimuthu
 *
 */
public class CubeProView {
	
	/**
	 * Attribute name for the view object
	 */
	public final String VIEW_ATTRIBUTE = "View_Object";

	/**
	 * DateFormat of the user
	 */
	private DateFormat userDateFormat;

	/**
	 * @return
	 */
	public DateFormat getUserDateFormat() {
		return userDateFormat;
	}

	/**
	 * @param userDateFormat
	 */
	public void setUserDateFormat(DateFormat userDateFormat) {
		this.userDateFormat = userDateFormat;
	}
	
}
