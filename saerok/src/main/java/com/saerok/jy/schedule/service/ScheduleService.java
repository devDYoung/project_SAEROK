package com.saerok.jy.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;
@Service
public interface ScheduleService {
	
	
	//캘린더에서 일정 보기
		List<Schedule> getSchedule(String empNo);
	
	
	//일정 작성
		int write(Schedule sc);

		//캘린더에서 일정 작성
		int modalwrite(Schedule sc);
		
		//일정 삭제
		int delete(String no);

		//일정 수정
		int edit(Schedule sc);

		//일정 목록 조회
		List<Schedule> selectList(String empNo);
		
		//전체 일정 갯수 조회
		int selectTotalCnt();

		//일정 상세조회 (번호)
		Schedule selectOne(String no);


		//중요 일정 등록
		String star(Schedule skd);

		//중요 일정 목록 조회
		List<Schedule> selectStarList(String empNo);

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
//	List<Schedule> selectPersonalSchedule(String empNo);
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
//	List<Schedule> selectFilteredMonthSchedule(String empNo, String skdTypeCd);
//	

	
	

}
