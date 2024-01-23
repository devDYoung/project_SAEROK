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
	int skdDelete(SqlSession session, String no);

	// 일정 수정
	int updateOne(SqlSession session,Schedule sc);

	// 일정 목록 조회
	List<Schedule> selectList(SqlSession session,String empNo);

	// 전체 일정 갯수 조회
	int selectTotalAll(SqlSession session);

	// 일정 상세조회 (번호)
	Schedule selectOne(SqlSession session, String no);

	// 캘린더에서 일정 보기
	List<Schedule> getSchedule(SqlSession session,String empNo);

	// 중요 일정 등록
	String insertImpt(SqlSession session,Schedule skd);
	
	//중요 일정 수정
	void updateImpt(SqlSession session, Schedule skd);

	// 중요 일정 목록 조회
	List<Schedule> selectImptList(SqlSession session, String no);

}
