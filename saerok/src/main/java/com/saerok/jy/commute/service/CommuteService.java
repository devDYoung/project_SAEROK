package com.saerok.jy.commute.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.saerok.jy.commute.dto.Commute;

public interface CommuteService {

	
	Commute selectCommuteList (Map<String, Object> param);
	
	Commute selectExsistWorkInList (Map<String, Object> param);
	
	List<Commute> selectCommuteWorkList(Map<String, Object> param);

	int insertCommuteStatus(String empNo);
	
	int updateCommuteEndTime(Map<String, Object> param);
	
	int updateWorkTime(Map<String, Object> param);
	
	int updateHalfDayOff(Map<String, Object> param);
	
	List<Commute> selectMonthWork(Map<String, Object> param);
	
	int selectWeekWorkTime(Map<String, Object> startEndMap);
	
	int selectWeekOverTime(Map<String, Object> startEndMap);
	
	List<Commute> selectWeekDatas(Map<String, Object> param);
	
	int weekTotalTime(Map<String, Object> param);
	
	int totalMonthTime(Map<String, Object> param);
	
	int monthOverTime(Map<String, Object> startEndMap);
	
	int checkStartwork(Map<String, Object> param);
	
	int updateStartWork(Map<String, Object> param);


}
