package com.cubepro.components;

import org.apache.struts.action.ActionForward;

public class CubeProActionForward extends ActionForward {

	private boolean success;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	
}
