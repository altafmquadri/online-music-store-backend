package com.capstone.exceptions;

@SuppressWarnings("serial")
public class IncorrectLoginException extends Exception {
	
	public IncorrectLoginException(String message) {
		super(message);
	}
}
