package com.saerok.jy.commute.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.saerok.jy.commute.dto.Commute;


public interface CommuteDao {

  
Commute selectCommuteList(SqlSession session, Map<String, Object> param);

Commute selectExsistWorkInList(SqlSession session, Map<String, Object> param);

List<Commute> selectCommuteWorkList(SqlSession session, Map<String, Object> param);


//int insertCommute(SqlSession sessoin, Map empNo);
//
//Commute selectCommute(SqlSession session, String empNo);
//
//int updateCommute(SqlSession session, int commuteNo);

int insertCommuteStatus(SqlSession session, String empNo);

int updateCommuteEndTime(SqlSession session, Map<String, Object> param);

int updateWorkTime(SqlSession session, Map<String,Object> param);

int updateHalfDayOff(SqlSession session, Map<String, Object> param);

List<Commute> selectMonthWork(SqlSession session, Map<String, Object> param);

int selectWeekWorkTime(SqlSession session, Map<String, Object> startEndMap);

int selectWeekOverTime(SqlSession session, Map<String, Object> startEndMap);

List<Commute> selectWeekDatas(SqlSession session, Map<String, Object> param);

int weekTotalTime(SqlSession session, Map<String, Object> param);

int totalMonthTime(SqlSession session, Map<String, Object> param);

int monthOverTime(SqlSession session, Map<String, Object> startEndMap);

int checkStartwork(SqlSession session, Map<String, Object> param);

int updateStartWork(SqlSession session, Map<String, Object> param);

//public ArrayList<Commute> selectCommuteStatusList(SqlSession session,int commuteNo);

}