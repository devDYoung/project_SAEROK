package com.saerok.jh.employee.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saerok.jh.employee.model.dao.EmployeeDao;
import com.saerok.jh.employee.model.dto.Employee;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {

	private final EmployeeDao dao;
	private final SqlSession session;

	//사원등록
	@Override
	@Transactional //트랜젝션 처리 어노테이션 
    public int insertEmployeeEnd(Map<String,Object> param) {
        
        return dao.insertEmployeeEnd(session,param);
    }
	
	//전체사원조회
	@Override
	public List<Employee> selectEmployeeList() {
		// TODO Auto-generated method stub
		return dao.selectEmployeeList(session);
	}

	
	//사원수정
	@Override
	public int updateEmployee(Employee e) {
		return dao.updateEmployee(session, e);
	}
	
	//사원삭제
	@Override
	public int deleteEmployee(Employee empNo) {
		return dao.deleteEmployee(session, empNo);
	}
	
	
	

	
	
	
	
	
	
	

}
