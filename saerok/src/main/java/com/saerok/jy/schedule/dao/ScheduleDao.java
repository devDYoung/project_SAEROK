package com.saerok.jy.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;

public interface ScheduleDao {

	// 일정 작성
	int insertSkd(SqlSession session, Schedule skd);

	// 캘린더에서 일정 작성
	int insertModalSkd(SqlSession session,Schedule skd);

	// 일정 삭제
	int skdDelete(SqlSession session, int no);

	// 일정 수정
	int updateOne(SqlSession session,Schedule schedule);

//	// 일정 목록 조회
//	List<Schedule> selectList(SqlSession session,PageFactory pf, Employee emp);

	// 전체 일정 갯수 조회
	int selectTotalAll(SqlSession session);

	// 일정 상세조회 (번호)
	Schedule selectOne(SqlSession session,int no);

	// 캘린더에서 일정 보기
	List<Schedule> getSkd(SqlSession session,String empNo);

	// 중요 일정 등록
	String insertImpt(SqlSession session,Schedule skd);
	
	//중요 일정 수정
	void updateImpt(SqlSession session, Schedule skd);

//	// 중요 일정 목록 조회
//	List<Schedule> selectImptList(SqlSession session,PageFactory pf, int no);

}
