package com.saerok.jh.employee.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public int insertEmployeeEnd(SqlSession session, Map<String,Object> param) {
		return session.insert("emp.insertEmployeeEnd", param);
	}

}
