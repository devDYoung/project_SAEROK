package com.saerok.jh.employee.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface EmployeeDao {

	int insertEmployeeEnd(SqlSession session,Map<String,Object> param);
	
	
}
