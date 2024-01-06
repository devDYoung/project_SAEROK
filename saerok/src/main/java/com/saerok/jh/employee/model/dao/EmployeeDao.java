package com.saerok.jh.employee.model.dao;

import org.apache.ibatis.session.SqlSession;

public interface EmployeeDao {

	int insertEmployee(SqlSession session);
	
	
}
