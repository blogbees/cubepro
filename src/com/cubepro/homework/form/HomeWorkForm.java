package com.cubepro.homework.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.homework.HomeWork;

public class HomeWorkForm extends CubeProActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */

	private HomeWork homeWorkDetail = new HomeWork();
	
	private List<HomeWork> homeWorkList = new ArrayList<HomeWork>();
	
	public HomeWork getHomeWorkDetail() {
		return homeWorkDetail;
	}

	public void setHomeWorkDetail(HomeWork homeWorkDetail) {
		this.homeWorkDetail = homeWorkDetail;
	}

	public List<HomeWork> getHomeWorkList() {
		return homeWorkList;
	}

	public void setHomeWorkList(List<HomeWork> homeWorkList) {
		this.homeWorkList = homeWorkList;
	}

}
