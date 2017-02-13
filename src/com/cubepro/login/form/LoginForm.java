package com.cubepro.login.form;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.components.enums.LocaleEnum;
import com.cubepro.login.entity.LoginDetails;

public class LoginForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8938285910773111223L;

	private LoginDetails loginDetails = new LoginDetails();
	
	private List<LoginDetails> loginDetailsList = new ArrayList<LoginDetails>();

	/**
	 * Locale of the user.
	 */
	private String localeCode;

	public LoginDetails getLoginDetails() {
		return loginDetails;
	}

	public void setLoginDetails(LoginDetails loginDetails) {
		this.loginDetails = loginDetails;
	}

	public String getLocaleCode() {
		return localeCode;
	}

	public void setLocaleCode(String localeCode) {
		this.localeCode = localeCode;
	}
	
	/**
	 * 
	 * @return
	 */
	public Collection<LocaleEnum> getAllLocales(){
		return LocaleEnum.ALL_LOCALES;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		loginDetails.setUserName("");
		loginDetails.setPassword("");
		localeCode = "";
	}

	public List<LoginDetails> getLoginDetailsList() {
		return loginDetailsList;
	}

	public void setLoginDetailsList(List<LoginDetails> loginDetailsList) {
		this.loginDetailsList = loginDetailsList;
	}
	
}
