package com.saerok.jh.employee.model.service;

import java.util.List;
import java.util.Map;

import com.saerok.jh.employee.model.dto.Employee;

public interface EmployeeService {
	 
	//사원등록
	 int insertEmployeeEnd(Map<String,Object> param);
	 
	//전체사원조회 
	 List<Employee> selectEmployeeList();
	
	
}