package com.saerok.jy.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
	
}