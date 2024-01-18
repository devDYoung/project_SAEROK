package com.saerok.jh.security;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

	public class MyAccessDeniedHandler implements AccessDeniedHandler {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
	AccessDeniedException accessDeniedException) throws IOException, ServletException {
	
		 throw  new AccessDeniedException("잘못된 접근입니다.");
	}
	
}
