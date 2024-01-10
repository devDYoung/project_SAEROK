package com.saerok.jy.commute.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saerok.jy.commute.common.CommuteException;
import com.saerok.jy.commute.dao.CommuteDao;
import com.saerok.jy.commute.dto.Commute;

@Service
@Repository
public class CommuteServiceImpl implements CommuteService {

	@Autowired
	private SqlSession session;

	@Autowired
	private CommuteDao commuteDao;

	@Override
	public ArrayList<Commute> selectCommuteList(Commute work) {

		ArrayList<Commute> list = commuteDao.selectCommuteList(session, work);

		return list;
	}

	@Override
	public Commute selectCommute(String empNo) {

		Commute c = commuteDao.selectCommute(session, empNo);

		return c;
	}

	@Override
	@Transactional
	public void insertCommute(String empNo) {

		int result = commuteDao.insertCommuteStatus(session, empNo);

		if (result < 0) {
			throw new CommuteException("출근 확인 실패");
		}

	}

	@Override
	@Transactional
	public void updateCommute(int commuteNo) {
		int result = commuteDao.updateCommute(session, commuteNo);

		if (result < 0) {
			throw new CommuteException("퇴근 확인 실패");
		}
	}

	@Override
	@Transactional
	public void insertCommuteStatus(String status) {
		int result = commuteDao.insertCommuteStatus(session, status);

		if (result < 0) {
			throw new CommuteException("근무상태변경 실패");
		}

	}

	@Override
	public ArrayList<Commute> selectCommuteStatusList(int commuteNo) {

		ArrayList<Commute> list = commuteDao.selectCommuteStatusList(session, commuteNo);

		return list;
	}

}
// test