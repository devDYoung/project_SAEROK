package com.saerok.jy.commute.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.jy.commute.dto.Commute;

@Repository
public class CommuteDaoImpl implements CommuteDao {
	
	@Override
	public List<Commute> selectCommuteList(SqlSession session, Map<String, Object> param) {
		return session.selectList("commute.selectCommuteList", param);
	}
// 에러난다

	@Override
	public int insertCommuteStatus(SqlSession session, Map status) {

		return session.insert("commute.insertCommuteStatus", status);
	}
	
	
	@Override
	public int updateCommuteEndTime(SqlSession session, Map status) {

		return session.update("commute.updateCommuteEndTime", status);
	}
	
	@Override
	public int updateWorkTime(SqlSession session,  Map<String, Object> param) {

		return session.update("commute.updateWorkTime", param);
	}
	
	@Override
	public int updateHalfDayOff(SqlSession session,  Map<String, Object> param) {

		return session.update("commute.updateHalfDayOff", param);
	}
	
	@Override
	public List<Commute> selectMonthWork(SqlSession session, Map<String, Object> param) {
		return session.selectList("commute.selectMonthWork", param);
	}

	@Override
	public int selectWeekWorkTime(SqlSession session, Map<String, Object> startEndMap) {
		return session.selectOne("commute.selectWeekWorkTime", startEndMap);
	}
	
	@Override
	public int selectWeekOverTime(SqlSession session, Map<String, Object> startEndMap) {
		return session.selectOne("commute.selectWeekOverTime", startEndMap);
	}
	
	
	@Override
	public List<Commute> selectWeekDatas(SqlSession session, Map<String, Object> param) {
		return session.selectList("commute.selectWeekDatas", param);
	}
	
	
	@Override
	public int weekTotalTime(SqlSession session, Map<String, Object> param) {
		return session.selectOne("commute.weekTotalTime", param);
	}
	
	@Override
	public int totalMonthTime(SqlSession session, Map<String, Object> param) {
		return session.selectOne("commute.totalMonthTime", param);
	}
	
	@Override
	public int monthOverTime(SqlSession session, Map<String, Object> startEndMap) {
		return session.selectOne("commute.monthOverTime", startEndMap);
	}
	
	
//	@Override
//	public ArrayList<Commute> selectCommuteStatusList(SqlSession session, int commuteNo) {
//
//		return (ArrayList) session.selectList("commute.selectCommuteStatusList", commuteNo);
//	}

}
