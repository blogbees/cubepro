package com.cubepro.general.exception;

public class ConfigurationException extends Exception {

	private String message;
	
	public ConfigurationException(String message) {
		super();
		this.message = message;
	}

	@Override
	public String getMessage() {
		return message;
	}
}
