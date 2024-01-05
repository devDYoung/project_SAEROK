package com.saerok.jy.commute.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saerok.jy.commute.common.CommuteException;
import com.saerok.jy.commute.dao.CommuteDao;
import com.saerok.jy.commute.dto.Commute;

@Service
public class CommuteServiceImpl implements CommuteService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommuteDao commuteDao;
	
	@Override
	public ArrayList<Commute> selectWorkList(Commute work) {

		ArrayList<Commute> list = commuteDao.selectWorkList(sqlSession, work);
		
		return list;
	}
	
	@Override
	public Commute selectWork(int empNo) {
		
		Commute c = commuteDao.selectWork(sqlSession, empNo);
		
		return c;
	}

	@Override
	public void insertWork(int empNo) {
		
		int result = commuteDao.insertWork(sqlSession, empNo);
		
		if(result < 0) {
			throw new CommuteException("출근 확인 실패");
		}
		
	}

	@Override
	public void updateWork(int commuteNo) {
		int result = commuteDao.updateWork(sqlSession, commuteNo);
		
		if(result < 0) {
			throw new CommuteException("퇴근 확인 실패");
		}
	}
}
