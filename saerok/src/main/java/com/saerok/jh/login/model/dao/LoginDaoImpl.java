package com.saerok.jh.login.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.jh.employee.model.dto.Employee;

@Repository
public class LoginDaoImpl implements LoginDao {
	
	//로그인
	@Override
	public Employee selectEmployeeByEmpNo(SqlSession session ,String empNo) {

		return session.selectOne("emp.selectEmployeeByEmpNo",empNo);
	}
	
	@Override
	public int updateMyPage(SqlSession session ,Employee e) {

		return session.update("emp.updateMyPage",e);
	}
	
	

}