//package com.saerok.jy.commute.service;
//
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.saerok.jy.commute.dao.CommuteDao;
//import com.saerok.jy.commute.dto.Commute;
//
//@Service
//public class CommuteServiceImpl implements CommuteService{
//	
//	@Autowired
//	private CommuteDao commuteDao;
//	
//	@Override
//	public int insertStartWork(String empNo) {
//		return CommuteDao.insertStartWork(empNo);
//	}
//	
//	@Override
//	public int updateStartWork(Map<String, Object> param) {
//		return CommuteDao.updateStartWork(param);
//	}
//	
//	@Override
//	public Commute selectStartwork(String commuteNo) {
//		return CommuteDao.selectStartwork(commuteNo);
//	}
//	
//	@Override
//	public int checkStartwork(Map<String, Object> param) {
//		return CommuteDao.checkStartwork(param);
//	}
//	
//	@Override
//	public Commute checkWorkTime(Map<String, Object> param) {
//		return CommuteDao.checkWorkTime(param);
//	}
//	
//	@Override
//	public int updateEndWok(Map<String, Object> param) {
//		return CommuteDao.updateEndWork(param);
//	}
//	
//	@Override
//	public int updateDayWorkTime(Map<String, Object> param) {
//		return CommuteDao.updateDayWorkTime(param);
//	}
//	
//	@Override
//	public int updateDayWorkTimeHalf(Map<String, Object> param) {
//		return CommuteDao.updateDayWorkTimeHalf(param);
//	}
//	
//	@Override
//	public List<Commute> selectMonthWork(Map<String, Object> param) {
//		return CommuteDao.selectMonthWok(param);
//	}
//	
//	@Override
//	public int totalMonthTime(Map<String, Object> param) {
//		return CommuteDao.totalMonthTime(param);
//	}
//	
//	@Override
//	public List<Commute> selectWeekDatas(Map<String, Object> param) {
//		return CommuteDao.selectWeekDatas(param);
//	}
//	
//	@Override
//	public int weekTotalTime(Map<String, Object> param) {
//		return CommuteDao.weekTotalTime(param);
//	}
//	
//	//주간 기본근무시간 가져오기
//	@Override
//	public int selectWeekWorkTime(Map<String, Object> startEndMap) {
//		return CommuteDao.selectWeekWorkTime(startEndMap);
//	}
//	
//	//주간 연장근무시간 가져오기
//	@Override
//	public int selectWeekOverTime(Map<String, Object> startEndMap) {
//		return CommuteDao.selectWeekOverTime(startEndMap);
//	}
//	
//	//월 연장근무시간 가져오기
//	@Override
//	public int monthOverTime(Map<String, Object> startEndMap) {
//		return CommuteDao.monthOverTime(startEndMap);
//	}
//	
//	@Override
//	public int insertRegDateState(WorkingManagement working) {
//		return CommuteDao.insertRegDateState(working);
//	} // insertRegDateState() end
//	
//	
//	@Override
//	public List<Map<String, Object>> findByEmpIdNoDate(String empNo) {
//		return CommuteDao.findByEmpIdNoDate(empNo);
//	} // findByEmpIdNoDate() end
//
//}
