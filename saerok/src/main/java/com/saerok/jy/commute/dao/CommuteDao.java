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
   
   // test 커밋
//   // 	public ArrayList<Work> selectWorkList(SqlSessionTemplate sqlSession, Work work) {
//	
//	return (ArrayList)sqlSession.selectList("hrMapper.selectWorkList", work);
//}
//public Work selectWork(SqlSessionTemplate sqlSession, int empNo) {
//	
//	return (Work)sqlSession.selectOne("hrMapper.selectWork", empNo);
//}
//
//public int insertWork(SqlSessionTemplate sqlSession, int empNo) {
//	
//	return sqlSession.insert("hrMapper.insertWork", empNo);
//}
//
//public int updateWork(SqlSessionTemplate sqlSession, String wNo) {
//	
//	return sqlSession.update("hrMapper.updateWork", wNo);
//}
//
//public int insertWorkStatus(SqlSessionTemplate sqlSession, WorkSInfo wsi) {
//	
//	return sqlSession.insert("hrMapper.insertWorkStatus", wsi);
//}
//
//public VacationInfo selectVacationInfo(SqlSessionTemplate sqlSession, int empNo) {
//	
//	return (VacationInfo)sqlSession.selectOne("hrMapper.selectVacationInfo", empNo);
//}
//
//public ArrayList<VRequest> selectVRequestList(SqlSessionTemplate sqlSession, int empNo) {
//	
//	return (ArrayList)sqlSession.selectList("hrMapper.selectVRequestList", empNo);
//}
//
//public ArrayList<VOccur> selectVOccurList(SqlSessionTemplate sqlSession, int empNo) {
//	
//	return (ArrayList)sqlSession.selectList("hrMapper.selectVOccurList", empNo);
//}
//
//public EmpInfo selectEmpInfo(SqlSessionTemplate sqlSession, int empNo) {
//	
//	return (EmpInfo)sqlSession.selectOne("hrMapper.selectEmpInfo", empNo);
//}
//public ArrayList<WorkSInfo> selectWorkSInfoList(SqlSessionTemplate sqlSession, String wNo) {
//	
//	return (ArrayList)sqlSession.selectList("hrMapper.selectWorkSInfoList", wNo);
//}


}