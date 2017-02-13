package com.cubepro.transaction;

public class BudgetDetails {
	private Integer assAndLiaId;
	private String year = "";
	private String date= "";
	private String type= "";
	private String subType= "";
	private String amount= "";
	private String desc= "";
	private String desc1= "";
	private String regBookNo= "";

	public Integer getAssAndLiaId() {
		return assAndLiaId;
	}

	public void setAssAndLiaId(Integer assAndLiaId) {
		this.assAndLiaId = assAndLiaId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getDesc1() {
		return desc1;
	}

	public void setDesc1(String desc1) {
		this.desc1 = desc1;
	}

	public String getRegBookNo() {
		return regBookNo;
	}

	public void setRegBookNo(String regBookNo) {
		this.regBookNo = regBookNo;
	}
}
