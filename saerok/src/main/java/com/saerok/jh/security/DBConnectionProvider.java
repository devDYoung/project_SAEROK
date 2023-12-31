//package com.saerok.jh.security;
//
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Component;
//
//import com.saerok.jh.login.model.dao.LoginDao;
//
//import lombok.RequiredArgsConstructor;
//
//@Component
//@RequiredArgsConstructor
//public class DBConnectionProvider implements AuthenticationProvider {
//	
//	private final LoginDao dao;
//	
//	//비밀번호 암호화 처리 
//	private BCryptPasswordEncoder encoder =new BCryptPasswordEncoder();
//	
//	//인증하는 메소드 
//	@Override 
//	public Authentication authenticate(Authentication authentication) throws AuthenticationException{
//		String empNo=authentication.getName(); //아이디를 가져옴
//		String empPw=(String)authentication.getCredentials(); //비밀번호 가져옴
//		
//		
//		
//	}
//	
//	
//	
//	
//	@Override
//	public boolean supports(Class<?> authentication) { //어떤 인증을 지원 할 것이냐 하는 메소드  //토큰 타입과 일치하면 인증
//		// TODO Auto-generated method stub
//		return UsernamePasswordAuthenticationToken
//				.class.isAssignableFrom(authentication);
//	}
//	
//	
//	
//	
//	
//	
//	
//}
