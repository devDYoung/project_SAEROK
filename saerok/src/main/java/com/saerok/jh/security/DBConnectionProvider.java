package com.saerok.jh.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.saerok.jh.common.mapper.EmployeeMapper;
import com.saerok.jh.employee.model.dto.Employee;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class DBConnectionProvider implements AuthenticationProvider {

	private final EmployeeMapper dao;

	// 비밀번호 암호화 처리
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	// 인증하는 메소드
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String empNo = authentication.getName(); // 아이디를 가져옴
		String empPw = (String) authentication.getCredentials(); // 비밀번호 가져옴

		Employee loginEmployee = dao.selectEmployeeByEmpNo(empNo);
		// EmployeeMapper를 사용하여 데이터베이스에서 사용자 정보를 조회한 결과
		// 이 부분은 사용자가 입력한 사원번호(empNo)에 대응하는 데이터베이스의 회원 정보를 가져와서 loginEmployee에 저장하는 부분

		if (loginEmployee == null || !encoder.matches(empPw, loginEmployee.getPassword())) {
			throw new BadCredentialsException("인증에 실패하셨습니다!");

		}
		return new UsernamePasswordAuthenticationToken(loginEmployee, loginEmployee.getPassword(),
				loginEmployee.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) { // 어떤 인증을 지원 할 것이냐 하는 메소드 //토큰 타입과 일치하면 인증
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
