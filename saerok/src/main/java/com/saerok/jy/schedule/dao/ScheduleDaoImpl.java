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
//	public int insertSkd(SqlSession session, Schedule schedule) {
//		return session.insert("schedule.insertSkd", schedule);
//	}
//
//	//모달에서 일정 작성
//	@Override
//	public int insertModalSkd(SqlSession session, Schedule schedule) {
//		return session.insert("schedule.insertModalSkd", schedule);
//	}
//	
//	//일정 삭제
//	@Override
//	public int skdDelete(SqlSession session, int no) {
//		return session.update("schedule.deleteSkd", no);
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
//	public int selectTotalAll(SqlSession session) {
//		return session.selectOne("schedule.selectToatalAll");
//	}
//
//	//일정 상세 조회(번호)
//	@Override
//	public Schedule selectOne(SqlSession session, int no) {
//		return session.selectOne("schedule.selectOne", no);
//	}
//
//	//캘린더 일정조회
//	@Override
//	public List<Schedule> getSkd(SqlSession session, String empNo) {
//		return session.selectList("schedule.skdList", empNo);
//	}
//
//	//중요 일정 등록
//	@Override
//	public String insertImpt(SqlSession session, Schedule skd) {
//		return session.selectOne("schedule.insertImpt", skd);
//	}
//
//	//중요 일정 수정
//	@Override
//	public void updateImpt(SqlSession session, Schedule skd) {
//		session.update("schedule.updateImpt", skd);
//	}
//
////	//중요 일정 목록 조회
////	@Override
////	public List<Schedule> selectImptList(SqlSession session, PageFactory pf, int no) {
////		if(pf != null) {
////			int offset = (pf.getCurrentPage()-1 * pf.getBoardLimit());
////			RowBounds rb = new RowBounds(offset, pf.getBoardLimit());
////			
////			return session.selectList("schedule.selectImptList", no, rb);
////		} else {
////			return session.selectList("schedule.selectImptList", no);
////		}
////	}
//
//
//}
