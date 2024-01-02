package com.saerok.jy.commute.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saerok.jy.commute.dao.CommuteDao;
import com.saerok.jy.commute.dto.Commute;

@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Autowired
	private CommuteDao commuteDao;
	private SqlSession session;
	
	@Override
	public int insertStartWork(String empNo) {
		return commuteDao.insertStartWork(session,empNo);
	}
	
	@Override
	public int updateStartWork(Map<String, Object> param) {
		return commuteDao.updateStartWork(session, param);
	}
	
	@Override
	public Commute selectStartwork(String commuteNo) {
		return commuteDao.selectStartwork(session, commuteNo);
	}
	
	@Override
	public int checkStartwork(Map<String, Object> param) {
		return commuteDao.checkStartwork(session, param);
	}
	
	@Override
	public Commute checkWorkTime(Map<String, Object> param) {
		return commuteDao.checkWorkTime(session, param);
	}
	
	@Override
	public int updateEndWok(Map<String, Object> param) {
		return commuteDao.updateEndWork(session, param);
	}
	
	@Override
	public int updateDayWorkTime(Map<String, Object> param) {
		return commuteDao.updateDayWorkTime(session, param);
	}
	
	@Override
	public int updateDayWorkTimeHalf(Map<String, Object> param) {
		return commuteDao.updateDayWorkTimeHalf(session, param);
	}
	
	@Override
	public List<Commute> selectMonthWork(Map<String, Object> param) {
		return commuteDao.selectMonthWok(session, param);
	}
	
	@Override
	public int totalMonthTime(Map<String, Object> param) {
		return commuteDao.totalMonthTime(session, param);
	}
	
	@Override
	public List<Commute> selectWeekDatas(Map<String, Object> param) {
		return commuteDao.selectWeekDatas(session, param);
	}
	
	@Override
	public int weekTotalTime(Map<String, Object> param) {
		return commuteDao.weekTotalTime(session, param);
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
	
	//월 연장근무시간 가져오기
	@Override
	public int monthOverTime(Map<String, Object> startEndMap) {
		return commuteDao.monthOverTime(session, startEndMap);
	}
	
	@Override
	public int insertRegDateState(Commute work) {
		return commuteDao.insertRegDateState(session, work);
	} // insertRegDateState() end
	
	
	@Override
	public List<Map<String, Object>> findByEmpIdNoDate(String empNo) {
		return commuteDao.findByEmpIdNoDate(session, empNo);
	} // findByEmpIdNoDate() end

}
