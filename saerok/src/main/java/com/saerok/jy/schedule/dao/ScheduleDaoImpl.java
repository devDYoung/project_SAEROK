package com.saerok.jy.schedule.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	//일정 작성
	@Override
	public int insertSkd(SqlSession session, Schedule sc) {
		return session.insert("schedule.insertSkd", sc);
	}

	//모달에서 일정 작성
	@Override
	public int insertModalSkd(SqlSession session, Schedule sc) {
		return session.insert("schedule.insertModalSkd", sc);
	}
	
	//일정 삭제
	@Override
	public int delete(SqlSession session, String no) {
		return session.update("schedule.deleteCalendar", no);
	}

	//일정 수정
	@Override
	public int updateOne(SqlSession session, Schedule sc) {
		return session.update("schedule.updateOne", sc);
	}

	//일정 목록 조회
	@Override
	public List<Schedule> selectList(SqlSession session, String empNo) {
	
		return session.selectList("schedule.selectList", empNo);
	}

	//일정 갯수 조회
	@Override
	public int selectCountAll(SqlSession session) {
		return session.selectOne("schedule.selectCountAll");
	}

	//일정 상세 조회(번호)
	@Override
	public Schedule selectOne(SqlSession session, String no) {
		return session.selectOne("schedule.selectOne", no);
	}

	//캘린더 일정조회
	@Override
	public List<Schedule> getSchedule(SqlSession session, String empNo) {
		return session.selectList("schedule.getSchedule", empNo);
	}

	//중요 일정 등록
	@Override
	public String selectStar(SqlSession session, Schedule skd) {
		return session.selectOne("schedule.selectStar", skd);
	}

	//중요 일정 수정
	@Override
	public void updateStar(SqlSession session, Schedule skd) {
		session.update("schedule.updateStar", skd);
	}

	//중요 일정 목록 조회
	@Override
	public List<Schedule> selectStarList(SqlSession session, String no) {
	
			return session.selectList("schedule.selectStarList", no);
	}
	
//	
//	// 오늘 날짜의 모든 일정 조회(홈)
//	public List<Schedule> selectTodaySchedule(SqlSession session, String empNo){
//		String todayYmd = LocalDate.now().toString();
//		return session.select("schedule.selectTodaySchedule",empNo, todayYmd);
//	}
//	
//	// 해당 달의 일정 목록 조회
//	public List<Schedule>  selectMonthSchedule(SqlSession session, String empNo){
//		return session.selectList("schedule.selectMonthSchedule",empNo);
//	}
//	
//	// 회사/부서/개인 일정
//	public List<Schedule> selectFilteredMonthSchedule(SqlSession session, String empNo, String skdTypeCd) {
//		// 회사 일정 조회
//	    if ("00".equals(skdTypeCd)) {
//	        return session.selectList("schedule.selectAdminSchedule");
//	        // 개인 일정 조회
//	    } else if ("99".equals(skdTypeCd)) {
//	        return session.selectList("schedule.selectPersonalSchedule",empNo);
//	        // 부서별 일정 조회
//	    } else {
//	        return session.selectList("schedule.selectDeptSchedule",empNo);
//	    }
//	}
//	
//	// 관리자 일정만
//	public List<Schedule>  selectAdminSchedule(SqlSession session) {
//		return session.selectList("schedule.selectAdminSchedule");
//	}
//	
//	// 선택한 일정 조회
//	public Schedule selectDateSchedule(SqlSession session, int scheduleNo){
//		return session.selectOne("schedule.selectDateSchedule",scheduleNo);
//	}
//	
//	// 일정 등록
//	public int insertSchedule(SqlSession session, Schedule schedule) {
//		return session.insert("schedule.insertSchedule",schedule);
//	}
//	
//	// 등록시 사용자 부서 세팅
//	public String setUserDept(SqlSession session, String empNo){
//		return session.selectOne("schedule.setUserDept",empNo);
//	}
//	
//	// 일정 수정
//	public int modifySchedule(SqlSession session, Schedule schdule) {
//		//log.debug("\u001B[41m" + "service modifySchedule schdule : " + schdule + "\u001B[0m");
//		return session.update("schedule.modifySchedule",schdule);
//	}
//	
//	// 일정 삭제
//	public int deleteSchedule(SqlSession session, int scheduleNo) {
//		return session.delete("schedule.deleteSchedule",scheduleNo);
//	}



}
