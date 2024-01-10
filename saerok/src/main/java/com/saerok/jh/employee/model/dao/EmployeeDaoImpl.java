package com.saerok.jh.employee.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.jh.employee.model.dto.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	
	//사원등록
	@Override
	public int insertEmployeeEnd(SqlSession session, Map<String,Object> param) {
		return session.insert("emp.insertEmployeeEnd", param);
	}
	
	//전체사원조회
	@Override
	public List<Employee> selectEmployeeList(SqlSession session) {
		return session.selectList("emp.selectEmployeeList");
	}
	
	
	

}
