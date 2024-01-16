package com.saerok.jy.commute.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.saerok.jy.commute.dto.Commute;

public interface CommuteService {

	//ArrayList<Commute> selectCommuteList(Commute commute);
	
	List<Commute> selectCommuteList (Map<String, Object> param);

	//Commute selectCommute(String empNo);
//
//	void insertCommute(String empNo);
//
//	void updateCommute(int commuteNo);

	int insertCommuteStatus(Map status);
	
	int updateCommuteEndTime(Map status);
	
	int updateWorkTime(Map<String, Object> param);
	
	int updateHalfDayOff(Map<String, Object> param);
	
	List<Commute> selectMonthWork(Map<String, Object> param);
	
	int selectWeekWorkTime(Map<String, Object> startEndMap);
	
	int selectWeekOverTime(Map<String, Object> startEndMap);
	
	List<Commute> selectWeekDatas(Map<String, Object> param);
	
	int weekTotalTime(Map<String, Object> param);
	
	int totalMonthTime(Map<String, Object> param);
	
	int monthOverTime(Map<String, Object> startEndMap);
	

//	ArrayList<Commute> selectCommuteStatusList(int commuteNo);

}
