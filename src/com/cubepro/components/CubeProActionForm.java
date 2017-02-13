package com.cubepro.components;

import com.cubepro.components.displaytable.PageSizeEnum;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.struts.action.ActionForm;

/**
 * Common implementation of ActionForm class. The screens can extend
 * this class and add the form data.
 * 
 * 
 *
 */
public abstract class CubeProActionForm extends ActionForm {
	
	protected String showPerPage="10";
	
	protected String pageNumber="";
	
	protected Collection<PageSizeEnum> pageSizeList;
	
	public DateFormat getDateFormat () {
		
		// TODO: Implement
		return null;
	}
	
	public NumberFormat getNumberFormat () {
		
		// TODO: Implement
		return null;
	}

	public String getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Collection<PageSizeEnum> getPageSizeList() {
		if(pageSizeList == null)
			pageSizeList =  PageSizeEnum.ALL_PAGESIZE;
		return pageSizeList;
	}

	public void setPageSizeList(Collection<PageSizeEnum> pageSizeList) {
		if(pageSizeList == null)
			pageSizeList =  PageSizeEnum.ALL_PAGESIZE;
		this.pageSizeList = pageSizeList;
	}

	public String getShowPerPage() {
		return showPerPage;
	}

	public void setShowPerPage(String showPerPage) {
		this.showPerPage = showPerPage;
	}
	

}
