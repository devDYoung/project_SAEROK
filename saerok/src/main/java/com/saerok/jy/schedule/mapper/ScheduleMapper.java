//package com.saerok.jy.schedule.mapper;
//
//import java.util.List;
//
//import org.apache.ibatis.annotations.Mapper;
//
//import com.saerok.jy.schedule.dto.Schedule;
//
//@Mapper
//public interface ScheduleMapper {
//	
//	// 오늘의 회사/부서/개인 일정 조회
//	List<Schedule> selectTodaySchedule(String empNo, String todayYmd);
//	
//	// 선택달의 일정보여주기
//	List<Schedule> selectMonthSchedule(String empNo);
//	
//	// 회사일정
//	List<Schedule> selectAdminSchedule();
//	
//	// 개인일정
//	List<Schedule> selectPersonalSchedule( String empNo);
//	
//	// 부서일정
//	List<Schedule> selectDeptSchedule(String empNo);
//	
//	// 해당 날짜의 일정상세 보여주기
//	Schedule selectDateSchedule(int scheduleNo);
//	
//	// 일정 등록
//	int insertSchedule(Schedule schedule);
//	
//	// 등록 시 사용자 부서코드 설정
//	String setUserDept(String empNo);
//	
//	// 일정 수정
//	int modifySchedule(Schedule schedule);
//	
//	// 일정 삭제
//	int deleteSchedule(int scheduleNo);
//
//}
