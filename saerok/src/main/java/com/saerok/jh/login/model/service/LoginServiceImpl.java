package com.saerok.jh.login.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jh.login.model.dao.LoginDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {
	

	private final LoginDao dao;
	private final SqlSession session;
	//private final BCryptPasswordEncoder encoder;
	
	
	//로그인
	@Override
	public Employee selectEmployeeByEmpNo(String employeeNo) {
		
		return dao.selectEmployeeByEmpNo(session,employeeNo);
	}
	
	
	//마이페이지
	
	public int updateMyPage(Employee e) {
		return dao.updateMyPage(session,e);
	}
	

}
