package com.saerok.jy.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;

public interface ScheduleDao {

	// 일정 작성
	int insertSkd(SqlSession session, Schedule sc);

	// 캘린더에서 일정 작성
	int insertModalSkd(SqlSession session,Schedule sc);

	// 일정 삭제
	int delete(SqlSession session, String no);

	// 일정 수정
	int updateOne(SqlSession session,Schedule sc);

	// 일정 목록 조회
	List<Schedule> selectList(SqlSession session,String empNo);

	// 전체 일정 갯수 조회
	int selectCountAll(SqlSession session);

	// 일정 상세조회 (번호)
	Schedule selectOne(SqlSession session, String no);

	// 캘린더에서 일정 보기
	List<Schedule> getSchedule(SqlSession session,String empNo);

	// 중요 일정 등록
	String selectStar(SqlSession session,Schedule skd);
	
	//중요 일정 수정
	void updateStar(SqlSession session, Schedule skd);

	// 중요 일정 목록 조회
	List<Schedule> selectStarList(SqlSession session, String no);
	
	

//	// 오늘의 회사/부서/개인 일정 조회
//	List<Schedule> selectTodaySchedule(SqlSession session, String userId, String todayYmd);
//	
//	// 선택달의 일정보여주기
//	List<Schedule> selectMonthSchedule(SqlSession session, String userId);
//	
//	// 회사일정
//	List<Schedule> selectAdminSchedule(SqlSession session);
//	
//	// 개인일정
//	List<Schedule> selectPersonalSchedule(SqlSession session, String userId);
//	
//	// 부서일정
//	List<Schedule> selectDeptSchedule(SqlSession session, String userId);
//	
//	// 해당 날짜의 일정상세 보여주기
//	Schedule selectDateSchedule(SqlSession session, int skdNo);
//	
//	// 일정 등록
//	int insertSchedule(SqlSession session, Schedule schedule);
//	
//	// 등록 시 사용자 부서코드 설정
//	String setUserDept(SqlSession session, String userId);
//	
//	// 일정 수정
//	int modifySchedule(SqlSession session, Schedule schedule);
//	
//	// 일정 삭제
//	int deleteSchedule(SqlSession session, int skdNo);

}
