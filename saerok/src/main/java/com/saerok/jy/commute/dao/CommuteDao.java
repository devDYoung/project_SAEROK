//package com.saerok.jy.commute.dao;
//
//public class CommuteDao {
//	
//	//출근버튼 누를시 출근정보 insert
//	int insertStartWork(SqlSession session, String empNo);
//	
//	Commute selectStartwork(SqlSession session,String commuteNo]o);
//
//	int checkStartwork(SqlSession session, Map<String, Object> param);
//
//	Commute checkWorkTime(SqlSession session, Map<String, Object> param);
//
//	int updateEndWork(SqlSession session, Map<String, Object> param);
//
//	//퇴근버튼 누를시 하루 총근무시간 계산
//	int updateDayWorkTime(SqlSession session, Map<String, Object> param);
//
//	List<Commute> selectMonthWok(SqlSession session, Map<String, Object> param);
//
//	List<Commute> selectWeekDatas(SqlSession session, Map<String, Object> param);
//
//	int weekTotalTime(SqlSession session, Map<String, Object> param);
//
//	int totalMonthTime(SqlSession session, Map<String, Object> param);
//
//	//주간 기본근무시간 가져오기
//	int selectWeekWorkTime(SqlSession session, Map<String, Object> startEndMap);
//
//	//주간 연장근무시간 가져오기
//	int selectWeekOverTime(SqlSession session, Map<String, Object> startEndMap);
//
//	//월 연장근무시간 가져오기
//	int monthOverTime(SqlSession session, Map<String, Object> startEndMap);
//	
//	int insertRegDateState(SqlSession session, Commute commute);
//
//	List<Map<String, Object>> findByEmpIdNoDate(SqlSession session, String empNo);
//
//	int updateDayWorkTimeHalf(SqlSession session, Map<String, Object> param);
//
//	int updateStartWork(SqlSession session, Map<String, Object> param);
//
//
//}
