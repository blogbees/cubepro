package com.cubepro.general.exception;

/**
 * User defined exception to handle the invalid parameters
 * submitted to the server
 * 
 * @author prabakar.marimuthu
 *
 */
public class InvalidParameterException extends Exception {

	private String message;
	
	public InvalidParameterException(String message) {
		super();
		this.message = message;
	}

	@Override
	public String toString() {
		
		return message;
	}
	
}
