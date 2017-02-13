package com.cubepro.menu;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Bean class to access main menu and sub menu details - name, link and width
 * 
 * 
 *
 */
public class Menu implements Serializable{

	/** Serialized for saving in session */
	private static final long serialVersionUID = -4566421012037166763L;

	/**
	 *  List of main menu details
	 */
	List<MenuDetails> mainMenu = new ArrayList<MenuDetails>();
	
	/**
	 * Maps the main menu with list of sub menu
	 */
	Map<String, List<MenuDetails>> subMenu = new HashMap<String, List<MenuDetails>>();
	
	/**
	 * @return the mainMenu
	 */
	public List<MenuDetails> getMainMenu() {
		return mainMenu;
	}
	/**
	 * @return the subMenu
	 */
	public Map<String, List<MenuDetails>> getSubMenu() {
		return subMenu;
	}
	/**
	 * @param mainMenu the mainMenu to set
	 */
	public void setMainMenu(List<MenuDetails> mainMenu) {
		this.mainMenu = mainMenu;
	}
	/**
	 * @param subMenu the subMenu to set
	 */
	public void setSubMenu(Map<String, List<MenuDetails>> subMenu) {
		this.subMenu = subMenu;
	}
	
}
