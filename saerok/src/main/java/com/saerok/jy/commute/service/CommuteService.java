package com.saerok.jy.commute.service;

import java.util.List;
import java.util.Map;

import com.saerok.jy.commute.dto.Commute;

public interface CommuteService {
	
	// 하루 근무 기록 조회
	Commute checkWorkTime(Map<String, Object> param);
	
	//출근 버튼 눌렀을 때 출근 시작시간 저장
	int insertStartWork(String empNo);

	Commute selectStartwork(String commuteNo);

	int checkStartwork(Map<String, Object> param);
	
	//퇴근버튼 눌렀을 때 퇴근 시간 업데이트
	int updateEndWok(Map<String, Object> param);
	
	// 퇴근 버튼 누르면 오늘 근무시간 업데이트
	int updateDayWorkTime(Map<String, Object> param);

	int insertRegDateState(Commute work);

	List<Map<String, Object>> findByEmpIdNoDate(String empNo);

	int updateDayWorkTimeHalf(Map<String, Object> param);

	int updateStartWork(Map<String, Object> param);

}
