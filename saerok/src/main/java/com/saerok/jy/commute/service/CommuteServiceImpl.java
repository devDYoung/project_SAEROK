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
	public Commute selectCommuteList(Map<String, Object> param) {
		return commuteDao.selectCommuteList(session, param);
	}

	@Override
	@Transactional
	public int insertCommuteStatus(Map status) {
		int result = commuteDao.insertCommuteStatus(session, status);

		if (result < 0) {
			throw new CommuteException("근무상태변경 실패");
		}
		return result;
	}
	
	
	
	@Override
	@Transactional
	public int updateCommuteEndTime(Map status) {
		int result = commuteDao.updateCommuteEndTime(session, status);
		
		if (result < 0) {
			throw new CommuteException("근무상태변경 실패");
		}
		return result;
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
	
	//주간 기본근무시간 가져오기
		@Override
		public int selectWeekWorkTime(Map<String, Object> startEndMap) {
			return commuteDao.selectWeekWorkTime(session, startEndMap);
		}
		
		//주간 연장근무시간 가져오기
		@Override
		public int selectWeekOverTime(Map<String, Object> startEndMap) {
			return commuteDao.selectWeekOverTime(session, startEndMap);
		}

		@Override
		public List<Commute> selectWeekDatas(Map<String, Object> param) {
			return commuteDao.selectWeekDatas(session, param);
		}
		
//	@Override
//	public ArrayList<Commute> selectCommuteStatusList(int commuteNo) {
//
//		ArrayList<Commute> list = commuteDao.selectCommuteStatusList(session, commuteNo);
//
//		return list;
//	}

}
// test