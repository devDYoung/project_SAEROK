package com.saerok.jh.login.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jh.login.model.dao.LoginDao;
import com.saerok.jh.security.DBConnectionProvider;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {
	

	private final LoginDao dao;
	private final SqlSession session;
	//private final DBConnectionProvider authManager;
	//private final BCryptPasswordEncoder encoder;
	
	//로그인
	@Override
	public Employee selectEmployeeByEmpNo(String employeeNo) {
		
		return dao.selectEmployeeByEmpNo(session,employeeNo);
	}
	
	
	//마이페이지
	
	public int updateMyPage(Employee e) {
		int result=dao.updateMyPage(session, e);
		if(result>0) {
			Employee loginEmployee=dao.selectEmployeeByEmpNo(session, e.getEmpNo());
			DBConnectionProvider authManager=new DBConnectionProvider(this);
			Authentication auth=authManager.authenticate(new UsernamePasswordAuthenticationToken(loginEmployee, 
					"updateData",
				loginEmployee.getAuthorities()));
			SecurityContextHolder.getContext().setAuthentication(auth);
		}
		return result;
	}
	

}
