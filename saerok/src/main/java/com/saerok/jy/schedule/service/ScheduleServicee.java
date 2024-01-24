//package com.saerok.jy.schedule.service;
//
//import java.time.LocalDate;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.saerok.jy.schedule.dto.Schedule;
//import com.saerok.jy.schedule.mapper.ScheduleMapper;
//
//@Service
//public class ScheduleServicee {
//	
//	@Autowired
//	ScheduleMapper scheduleMapper;
//	
//	// 오늘 날짜의 모든 일정 조회(홈)
//	public List<Schedule> selectTodaySchedule(String empNo){
//		String todayYmd = LocalDate.now().toString();
//		return scheduleMapper.selectTodaySchedule(empNo, todayYmd);
//	}
//	
//	// 해당 달의 일정 목록 조회
//	public List<Schedule>  selectMonthSchedule(String empNo){
//		return scheduleMapper.selectMonthSchedule(empNo);
//	}
//	
//	// 회사/부서/개인 일정
//	public List<Schedule> selectFilteredMonthSchedule(String empNo, String skdTypeCd) {
//		// 회사 일정 조회
//	    if ("00".equals(skdTypeCd)) {
//	        return scheduleMapper.selectAdminSchedule();
//	        // 개인 일정 조회
//	    } else if ("99".equals(skdTypeCd)) {
//	        return scheduleMapper.selectPersonalSchedule(empNo);
//	        // 부서별 일정 조회
//	    } else {
//	        return scheduleMapper.selectDeptSchedule(empNo);
//	    }
//	}
//	
//	// 관리자 일정만
//	public List<Schedule>  selectAdminSchedule() {
//		return scheduleMapper.selectAdminSchedule();
//	}
//	
//	// 선택한 일정 조회
//	public Schedule selectDateSchedule(int scheduleNo){
//		return scheduleMapper.selectDateSchedule(scheduleNo);
//	}
//	
//	// 일정 등록
//	public int insertSchedule(Schedule schedule) {
//		return scheduleMapper.insertSchedule(schedule);
//	}
//	
//	// 등록시 사용자 부서 세팅
//	public String setUserDept(String empNo){
//		return scheduleMapper.setUserDept(empNo);
//	}
//	
//	// 일정 수정
//	public int modifySchedule(Schedule schdule) {
//		//log.debug("\u001B[41m" + "service modifySchedule schdule : " + schdule + "\u001B[0m");
//		return scheduleMapper.modifySchedule(schdule);
//	}
//	
//	// 일정 삭제
//	public int deleteSchedule(int scheduleNo) {
//		return scheduleMapper.deleteSchedule(scheduleNo);
//	}
//
//}
