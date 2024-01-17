//package com.saerok.jy.schedule.dao;
//
//import java.util.List;
//
//import org.apache.ibatis.session.RowBounds;
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.stereotype.Repository;
//
//import com.saerok.PageFactory;
//import com.saerok.jh.employee.model.dto.Employee;
//import com.saerok.jy.schedule.dto.Schedule;
//
//@Repository
//public class ScheduleDaoImpl implements ScheduleDao{
//	
//	//일정 작성
//	@Override
//	public int insertCalendar(SqlSession session, Schedule schedule) {
//		return session.insert("schedule.insertCalendar", schedule);
//	}
//
//	//모달에서 일정 작성
//	@Override
//	public int insertModalCalendar(SqlSession session, Schedule schedule) {
//		return session.insert("schedule.insertModalCalendar", schedule);
//	}
//	
//	//일정 삭제
//	@Override
//	public int skdDelete(SqlSession session, String no) {
//		return session.update("schedule.skdDelete", no);
//	}
//
//	//일정 수정
//	@Override
//	public int updateOne(SqlSession session, Schedule schedule) {
//		return session.update("schedule.updateOne", schedule);
//	}
//
//	//일정 목록 조회
//	@Override
//	public List<Schedule> selectList(SqlSession session, PageFactory pf, Employee emp) {
//		
////		int offset = (pf.getCurrentPage()-1 * pf.getBoardLimit());
////		RowBounds rb = new RowBounds(offset, pf.getBoardLimit());
//		
//		return session.selectList("schedule.selectList", emp, rb);
//	}
//
//	//일정 갯수 조회
//	@Override
//	public int selectCountAll(SqlSession session) {
//		return session.selectOne("schedule.selectCountAll");
//	}
//
//	//일정 상세 조회(번호)
//	@Override
//	public Schedule selectOne(SqlSession session, String no) {
//		return session.selectOne("schedule.selectOne", no);
//	}
//
//	//캘린더 일정조회
//	@Override
//	public List<Schedule> getSkd(SqlSession session, Employee emp) {
//		return session.selectList("schedule.calendarList", emp);
//	}
//
//	//중요 일정 등록
//	@Override
//	public String selectImpt(SqlSession session, Schedule schedule) {
//		return session.selectOne("schedule.selectImpt", schedule);
//	}
//
//	//중요 일정 수정
//	@Override
//	public void updateImpt(SqlSession session, Schedule schedule) {
//		session.update("schedule.updateImpt", schedule);
//	}
//
//	//중요 일정 목록 조회
//	@Override
//	public List<Schedule> selectImptList(SqlSession session, PageFactory pf, String no) {
//		if(pf != null) {
//			int offset = (pf.getCurrentPage()-1 * pf.getBoardLimit());
//			RowBounds rb = new RowBounds(offset, pf.getBoardLimit());
//			
//			return session.selectList("schedule.selectImptList", no, rb);
//		} else {
//			return session.selectList("schedule.selectImptList", no);
//		}
//	}
//
//
//}
