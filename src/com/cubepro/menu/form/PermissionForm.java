package com.cubepro.menu.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.login.entity.LoginDetails;
import com.cubepro.menu.MenuPermissions;
import com.cubepro.menu.Menus;

public class PermissionForm extends CubeProActionForm{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1188722141334268700L;

	/**
	 * 
	 */
	private MenuPermissions menuPermissions = new MenuPermissions();
	
	private List<MenuPermissions> menuPermissionsList = new ArrayList<MenuPermissions>();
	
	private List<Menus> menusList =  new ArrayList<Menus>();

	private List<LoginDetails> loginDetailsList = new ArrayList<LoginDetails>();
	public MenuPermissions getMenuPermissions() {
		return menuPermissions;
	}

	public void setMenuPermissions(MenuPermissions menuPermissions) {
		this.menuPermissions = menuPermissions;
	}

	public List<MenuPermissions> getMenuPermissionsList() {
		return menuPermissionsList;
	}

	public void setMenuPermissionsList(List<MenuPermissions> menuPermissionsList) {
		this.menuPermissionsList = menuPermissionsList;
	}

	public List<Menus> getMenusList() {
		return menusList;
	}

	public void setMenusList(List<Menus> menusList) {
		this.menusList = menusList;
	}

	public List<LoginDetails> getLoginDetailsList() {
		return loginDetailsList;
	}

	public void setLoginDetailsList(List<LoginDetails> loginDetailsList) {
		this.loginDetailsList = loginDetailsList;
	}

}
