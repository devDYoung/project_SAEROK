package com.saerok.jh.employee.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saerok.jh.employee.model.dto.Employee;

public interface EmployeeDao {

	
	//사원등록
	int insertEmployeeEnd(SqlSession session,Map<String,Object> param);
	
	//전체사원조회
	List<Employee> selectEmployeeList(SqlSession session);
	
	//사원수정
	int updateEmployee(SqlSession session, Employee e);
	
	//사원삭제
	int deleteEmployee(SqlSession session, Employee empNo);
	
}