package com.saerok.jh.security;

public class AccessDeniedException extends RuntimeException {
	
	public AccessDeniedException(String msg) {
		super(msg);
	}
}
