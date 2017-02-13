package com.cubepro.transaction;

public class TransactionMaster {

	private Integer transMasterId ;
	
	private String type;
	
	private String subType;
	
	private String desc;
	
	private String status;

	public Integer getTransMasterId() {
		return transMasterId;
	}

	public void setTransMasterId(Integer transMasterId) {
		this.transMasterId = transMasterId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
