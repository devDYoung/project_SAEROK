package com.saerok.jh.login.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.saerok.jh.employee.model.dto.Employee;

public interface LoginDao {
	
	Employee selectEmployeeByEmpNo(SqlSession session, String empNo);
	
	int updateMyPage(SqlSession session, Employee e);
	
}
