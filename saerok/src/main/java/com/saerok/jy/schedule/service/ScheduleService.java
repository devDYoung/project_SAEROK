package com.saerok.jy.schedule.service;

import java.util.List;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;

public interface ScheduleService {
	//일정 작성
		int skdWrite(Schedule schedule);

		//캘린더에서 일정 작성
		int modalwrite(Schedule schedule);
		
		//일정 삭제
		int skdDelete(int no);

		//일정 수정
		int skdEdit(Schedule schedule);

		//일정 목록 조회
		List<Schedule> selectList(PageFactory pf, Employee emp);
		
		//전체 일정 갯수 조회
		int selectToatalCnt();

		//일정 상세조회 (번호)
		Schedule selectOne(String no);

		//캘린더에서 일정 보기
		List<Schedule> getSkd(String empNo);

		//중요 일정 등록
		String star(Schedule cv);

		//중요 일정 목록 조회
		List<Schedule> selectStarList(PageFactory pf, String empNo);

	

}
