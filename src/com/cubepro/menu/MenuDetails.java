package com.cubepro.menu;


import java.io.Serializable;
import java.util.List;

import com.cubepro.components.enums.MenuDetailsEnum;

/**
 * Bean class to hold menu name, link, menuWidth, cssClass and sort order
 * 
 * @author kiruthika.vijayaraga
 *
 */
public class MenuDetails implements Comparable<MenuDetails>, Serializable{

	/** Serialized to save it in session */
	private static final long serialVersionUID = -7522065853570053348L;
	
	private int menuWidth;
	private int sortOrder;
	
	private String menuNameKey;
	private String cssClass;
	private String link;
	private String permission;
	private MenuDetailsEnum parent;
	private MenuDetailsEnum menuItem;
	private List<MenuDetails> levelTwoMenuList;
	private Boolean hasLevelTwoMenu;
	
	/**
	 * @return the menuNameKey
	 */
	public String getMenuNameKey() {
		return menuNameKey;
	}
	/**
	 * @param menuNameKey the menuNameKey to set
	 */
	public void setMenuNameKey(String menuNameKey) {
		this.menuNameKey = menuNameKey;
	}
	
	/**
	 * @return the link
	 */
	public String getLink() {
		return link;
	}
	/**
	 * @return the subMenuWidth
	 */
	public int getMenuWidth() {
		return menuWidth;
	}
	
	/**
	 * @param link the link to set
	 */
	public void setLink(String link) {
		this.link = link;
	}
	/**
	 * @param subMenuWidth the subMenuWidth to set
	 */
	public void setMenuWidth(int subMenuWidth) {
		this.menuWidth = subMenuWidth;
	}
	/**
	 * @return the cssClass
	 */
	public String getCssClass() {
		return cssClass;
	}
	/**
	 * @param cssClass the cssClass to set
	 */
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	/**
	 * @return the sortOrder
	 */
	public int getSortOrder() {
		return sortOrder;
	}
	/**
	 * @param sortOrder the sortOrder to set
	 */
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(MenuDetails o) {
		return this.sortOrder - o.sortOrder;
	}
	/**
	 * @return the permission
	 */
	public String getPermission() {
		return permission;
	}
	/**
	 * @param permission the permission to set
	 */
	public void setPermission(String permission) {
		this.permission = permission;
	}
	/**
	 * @return the parent
	 */
	public MenuDetailsEnum getParent() {
		return parent;
	}
	/**
	 * @param parent the parent to set
	 */
	public void setParent(MenuDetailsEnum parent) {
		this.parent = parent;
	}
	/**
	 * @return the menuItem
	 */
	public MenuDetailsEnum getMenuItem() {
		return menuItem;
	}
	/**
	 * @param menuItem the menuItem to set
	 */
	public void setMenuItem(MenuDetailsEnum menuItem) {
		this.menuItem = menuItem;
	}
	
	/**
	 * @return the levelTwoMenuList
	 */
	public List<MenuDetails> getLevelTwoMenuList() {
	
		return levelTwoMenuList;
	}
	
	/**
	 * @param levelTwoMenuList the levelTwoMenuList to set
	 */
	public void setLevelTwoMenuList(List<MenuDetails> levelTwoMenuList) {
	
		this.levelTwoMenuList = levelTwoMenuList;
	}
	/**
	 * @return the hasChildren
	 */
	public Boolean getHasLevelTwoMenu() {
		return hasLevelTwoMenu;
	}
	/**
	 * @param hasChildren the hasChildren to set
	 */
	public void setHasLevelTwoMenu(Boolean hasLevelTwoMenu) {
		this.hasLevelTwoMenu = hasLevelTwoMenu;
	}
	
	
}
