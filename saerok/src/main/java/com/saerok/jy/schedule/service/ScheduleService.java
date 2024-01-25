package com.saerok.jy.schedule.service;

import java.util.List;


import org.springframework.stereotype.Service;

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

	
	

}
