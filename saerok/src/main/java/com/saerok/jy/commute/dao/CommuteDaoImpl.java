//package com.saerok.jy.commute.dao;
//
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.stereotype.Repository;
//
//import com.saerok.jy.commute.dto.Commute;
//
//@Repository
//public class CommuteDaoImpl implements CommuteDao{
//	
//	//출근버튼 누를시 출근정보 insert
//    @Override
//    public int insertStartWork(SqlSession session, String empNo) {
//        return session.insert("insertStartWork", empNo);
//    }
//
//    @Override
//    public Commute selectStartwork(SqlSession session, String commuteNo) {
//        return session.selectOne("selectStartwork", commuteNo);
//    }
//
//    @Override
//    public int checkStartwork(SqlSession session, Map<String, Object> param) {
//        return session.selectOne("checkStartwork", param);
//    }
//
//    @Override
//    public Commute checkWorkTime(SqlSession session, Map<String, Object> param) {
//        return session.selectOne("checkWorkTime", param);
//    }
//
//    @Override
//    public int updateEndWork(SqlSession session, Map<String, Object> param) {
//        return session.update("updateEndWork", param);
//    }
//
//    @Override
//    public int updateDayWorkTime(SqlSession session, Map<String, Object> param) {
//        return session.update("updateDayWorkTime", param);
//    }
//
//    @Override
//    public List<Commute> selectMonthWok(SqlSession session, Map<String, Object> param) {
//        return session.selectList("selectMonthWok", param);
//    }
//
//    @Override
//    public List<Commute> selectWeekDatas(SqlSession session, Map<String, Object> param) {
//        return session.selectList("selectWeekDatas", param);
//    }
//
//    @Override
//    public int weekTotalTime(SqlSession session, Map<String, Object> param) {
//        return session.selectOne("weekTotalTime", param);
//    }
//
//    @Override
//    public int totalMonthTime(SqlSession session, Map<String, Object> param) {
//        return session.selectOne("totalMonthTime", param);
//    }
//
//    @Override
//    public int selectWeekWorkTime(SqlSession session, Map<String, Object> startEndMap) {
//        return session.selectOne("selectWeekWorkTime", startEndMap);
//    }
//
//    @Override
//    public int selectWeekOverTime(SqlSession session, Map<String, Object> startEndMap) {
//        return session.selectOne("selectWeekOverTime", startEndMap);
//    }
//
//    @Override
//    public int monthOverTime(SqlSession session, Map<String, Object> startEndMap) {
//        return session.selectOne("monthOverTime", startEndMap);
//    }
//
//    @Override
//    public int insertRegDateState(SqlSession session, Commute commute) {
//        return session.insert("insertRegDateState", commute);
//    }
//
//    @Override
//    public List<Map<String, Object>> findByEmpIdNoDate(SqlSession session, String empNo) {
//        return session.selectList("findByEmpIdNoDate", empNo);
//    }
//
//    @Override
//    public int updateDayWorkTimeHalf(SqlSession session, Map<String, Object> param) {
//        return session.update("updateDayWorkTimeHalf", param);
//    }
//
//    @Override
//    public int updateStartWork(SqlSession session, Map<String, Object> param) {
//        return session.update("updateStartWork", param);
//    }
//}
