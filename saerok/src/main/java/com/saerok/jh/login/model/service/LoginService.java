package com.saerok.jh.login.model.service;

import com.saerok.jh.employee.model.dto.Employee;

public interface LoginService {
	
	//로그인 
	Employee selectEmployeeByEmpNo(String employeeNo);
}
