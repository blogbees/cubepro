package com.cubepro.menu;

import com.cubepro.login.entity.LoginDetails;

public class MenuPermissions {

	Menus menus = new Menus();
	LoginDetails loginDetails = new LoginDetails();
	Integer menuPermissionsId = Integer.valueOf(0);

	public Menus getMenus() {
		return menus;
	}

	public void setMenus(Menus menus) {
		this.menus = menus;
	}

	public LoginDetails getLoginDetails() {
		return loginDetails;
	}

	public void setLoginDetails(LoginDetails loginDetails) {
		this.loginDetails = loginDetails;
	}

	public Integer getMenuPermissionsId() {
		return menuPermissionsId;
	}

	public void setMenuPermissionsId(Integer menuPermissionsId) {
		this.menuPermissionsId = menuPermissionsId;
	}

}
