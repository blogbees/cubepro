package com.cubepro.homework;

public class HomeWork {
	private Integer homeWorkId = Integer.valueOf(0);

	private String homeWorkName;
	private String homeWorkDesc;

	public Integer getHomeWorkId() {
		return homeWorkId;
	}

	public void setHomeWorkId(Integer homeWorkId) {
		this.homeWorkId = homeWorkId;
	}

	public String getHomeWorkName() {
		return homeWorkName;
	}

	public void setHomeWorkName(String homeWorkName) {
		this.homeWorkName = homeWorkName;
	}

	public String getHomeWorkDesc() {
		return homeWorkDesc;
	}

	public void setHomeWorkDesc(String homeWorkDesc) {
		this.homeWorkDesc = homeWorkDesc;
	}
	
	public String getHomeWorkNameWithDesc(){
		return homeWorkName+"-"+homeWorkDesc;
	}
}
