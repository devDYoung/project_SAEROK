package com.saerok.jy.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	//일정 작성
	@Override
	public int insertSkd(SqlSession session, Schedule sc) {
		return session.insert("schedule.insertSkd", sc);
	}

	//모달에서 일정 작성
	@Override
	public int insertModalSkd(SqlSession session, Schedule sc) {
		return session.insert("schedule.insertModalSkd", sc);
	}
	
	//일정 삭제
	@Override
	public int skdDelete(SqlSession session, String no) {
		return session.update("schedule.deleteSkd", no);
	}

	//일정 수정
	@Override
	public int updateOne(SqlSession session, Schedule sc) {
		return session.update("schedule.updateOne", sc);
	}

	//일정 목록 조회
	@Override
	public List<Schedule> selectList(SqlSession session, PageFactory pf, String empNo) {
	
		return session.selectList("schedule.selectList", empNo);
	}

	//일정 갯수 조회
	@Override
	public int selectTotalAll(SqlSession session) {
		return session.selectOne("schedule.selectToatalAll");
	}

	//일정 상세 조회(번호)
	@Override
	public Schedule selectOne(SqlSession session, String no) {
		return session.selectOne("schedule.selectOne", no);
	}

	//캘린더 일정조회
	@Override
	public List<Schedule> getSchedule(SqlSession session, String empNo) {
		return session.selectList("schedule.getSchedule", empNo);
	}

	//중요 일정 등록
	@Override
	public String insertImpt(SqlSession session, Schedule skd) {
		return session.selectOne("schedule.insertImpt", skd);
	}

	//중요 일정 수정
	@Override
	public void updateImpt(SqlSession session, Schedule skd) {
		session.update("schedule.updateImpt", skd);
	}

//	//중요 일정 목록 조회
//	@Override
//	public List<Schedule> selectImptList(SqlSession session, PageFactory pf, String no) {
//		
//			
//			return session.selectList("schedule.selectImptList", no, rb);
//		} else {
//			return session.selectList("schedule.selectImptList", no);
//		}
//	}


}
