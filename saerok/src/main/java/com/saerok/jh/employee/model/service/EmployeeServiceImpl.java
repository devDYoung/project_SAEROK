package com.saerok.jh.employee.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saerok.jh.employee.model.dao.EmployeeDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {

	private final EmployeeDao dao;
	private final SqlSession session;

	@Override
	@Transactional
    public int insertEmployeeEnd( Map<String,Object> param) {
        
        return dao.insertEmployeeEnd(session,param);
    }

}
