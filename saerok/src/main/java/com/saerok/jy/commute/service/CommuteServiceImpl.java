package com.saerok.jy.commute.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saerok.jy.commute.dao.CommuteDao;
import com.saerok.jy.commute.dto.Commute;

@Service
//@Repository
public class CommuteServiceImpl implements CommuteService {

	@Autowired
	private SqlSession session;

	@Autowired
	private CommuteDao commuteDao;

	@Override
	public Commute selectCommuteList(Map<String, Object> param) {
		return commuteDao.selectCommuteList(session, param);
	}

	@Override
	public Commute selectExsistWorkInList(Map<String, Object> param) {
		return commuteDao.selectExsistWorkInList(session, param);
	}

	@Override
	public List<Commute> selectCommuteWorkList(Map<String, Object> param) {
		return commuteDao.selectCommuteWorkList(session, param);
	}
	
	@Override
	@Transactional
	public int insertCommuteStatus(String empNo) {
		return commuteDao.insertCommuteStatus(session, empNo);
	}

	@Override
	@Transactional
	public int updateCommuteEndTime(Map<String, Object> param) {
		return commuteDao.updateCommuteEndTime(session,param);
	}

	@Override
	public int updateWorkTime(Map<String, Object> param) {
		return commuteDao.updateWorkTime(session, param);
	}

	@Override
	public int updateHalfDayOff(Map<String, Object> param) {
		return commuteDao.updateHalfDayOff(session, param);
	}

	@Override
	public List<Commute> selectMonthWork(Map<String, Object> param) {
		return commuteDao.selectMonthWork(session, param);
	}

	// 주간 기본근무시간 가져오기
	@Override
	public int selectWeekWorkTime(Map<String, Object> startEndMap) {
		return commuteDao.selectWeekWorkTime(session, startEndMap);
	}

	// 주간 연장근무시간 가져오기
	@Override
	public int selectWeekOverTime(Map<String, Object> startEndMap) {
		return commuteDao.selectWeekOverTime(session, startEndMap);
	}

	@Override
	public List<Commute> selectWeekDatas(Map<String, Object> param) {
		return commuteDao.selectWeekDatas(session, param);
	}

	@Override
	public int weekTotalTime(Map<String, Object> param) {
		return commuteDao.weekTotalTime(session, param);
	}

	@Override
	public int totalMonthTime(Map<String, Object> param) {
		return commuteDao.totalMonthTime(session, param);
	}

	@Override
	public int monthOverTime(Map<String, Object> startEndMap) {
		return commuteDao.monthOverTime(session, startEndMap);
	}
	
	@Override
	public int checkStartwork(Map<String, Object> param) {
		return commuteDao.checkStartwork(session,param);
	}
	
	
	@Override
	public int updateStartWork(Map<String, Object> param) {
		return commuteDao.updateStartWork(session,param);
	}

}
