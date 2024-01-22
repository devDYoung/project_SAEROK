package com.saerok.jy.schedule.service;

import java.util.List;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;

public interface ScheduleService {
	//일정 작성
		int skdWrite(Schedule skd);

		//캘린더에서 일정 작성
		int modalwrite(Schedule skd);
		
		//일정 삭제
		int skdDelete(int no);

		//일정 수정
		int skdEdit(Schedule skd);

		//일정 목록 조회
		List<Schedule> selectList(PageFactory pf, String empNo);
		
		//전체 일정 갯수 조회
		int selectTotalCnt();

		//일정 상세조회 (번호)
		Schedule selectOne(String no);

		//캘린더에서 일정 보기
		List<Schedule> getSkd(String empNo);

		//중요 일정 등록
		String skdImpt(Schedule skd);

//		//중요 일정 목록 조회
//		List<Schedule> selectImptList(PageFactory pf, String empNo);

	

}
