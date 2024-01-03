package com.saerok.jy.commute.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.saerok.jy.commute.dto.Commute;

public interface CommuteDao {
	
	//출근버튼 누를시 출근정보 insert
	int insertStartWork(SqlSession session, String empNo);
	
	Commute selectStartwork(SqlSession session,String commuteNo);

	int checkStartwork(SqlSession session, Map<String, Object> param);

	Commute checkWorkTime(SqlSession session, Map<String, Object> param);

	int updateEndWork(SqlSession session, Map<String, Object> param);

	//퇴근버튼 누를시 하루 총근무시간 계산
	int updateDayWorkTime(SqlSession session, Map<String, Object> param);
	
	int insertRegDateState(SqlSession session, Commute commute);

	List<Map<String, Object>> findByEmpIdNoDate(SqlSession session, String empNo);

	int updateDayWorkTimeHalf(SqlSession session, Map<String, Object> param);

	int updateStartWork(SqlSession session, Map<String, Object> param);
	
	// test 커

}
