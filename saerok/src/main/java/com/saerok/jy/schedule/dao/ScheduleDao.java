package com.saerok.jy.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.saerok.PageFactory;
import com.saerok.jy.schedule.dto.Schedule;

public interface ScheduleDao {

	// 일정 작성
	int skdWrite(SqlSession session, Schedule schedule);

	// 캘린더에서 일정 작성
	int modalwrite(SqlSession session,Schedule schedule);

	// 일정 삭제
	int skdDelete(SqlSession session,String empNo);

	// 일정 수정
	int skdEdit(SqlSession session,Schedule schedule);

	// 일정 목록 조회
	List<Schedule> selectList(SqlSession session,PageFactory pf, String empNo);

	// 전체 일정 갯수 조회
	int selectToatalCnt(SqlSession session);

	// 일정 상세조회 (번호)
	Schedule selectOne(SqlSession session,String empNo);

	// 캘린더에서 일정 보기
	List<Schedule> getSkd(SqlSession session,String empNo);

	// 중요 일정 등록
	String skdImpt(SqlSession session,Schedule skd);

	// 중요 일정 목록 조회
	List<Schedule> selectImptList(SqlSession session,PageFactory pf, String empNo);

}
