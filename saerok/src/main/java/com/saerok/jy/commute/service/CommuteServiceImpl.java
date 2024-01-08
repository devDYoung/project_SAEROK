package com.saerok.jy.commute.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saerok.jy.commute.common.CommuteException;
import com.saerok.jy.commute.dao.CommuteDao;
import com.saerok.jy.commute.dto.Commute;

@Service
public class CommuteServiceImpl implements CommuteService{
	@Autowired
	private SqlSession session;
	
	@Autowired
	private CommuteDao commuteDao;
	
	@Override
	public ArrayList<Commute> selectWorkList(Commute work) {

		ArrayList<Commute> list = commuteDao.selectWorkList(session, work);
		
		return list;
	}
	
	@Override
	public Commute selectWork(String empNo) {
		
		Commute c = commuteDao.selectWork(session, empNo);
		
		return c;
	}

	@Override
	@Transactional
	public void insertWork(String empNo) {
		
		int result = commuteDao.insertWork(session, empNo);
		
		if(result < 0) {
			throw new CommuteException("출근 확인 실패");
		}
		
	}

	@Override
	@Transactional
	public void updateWork(int commuteNo) {
		int result = commuteDao.updateWork(session, commuteNo);
		
		if(result < 0) {
			throw new CommuteException("퇴근 확인 실패");
		}
	}
	
	@Override
	@Transactional
	public void insertWorkStatus(String status) {
		int result = commuteDao.insertWorkStatus(session, status);
		
		if(result < 0) {
			throw new CommuteException("근무상태변경 실패");
		}
		
	}
}
