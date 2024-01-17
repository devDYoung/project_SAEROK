//package com.saerok.jy.schedule.service;
//
//import java.text.SimpleDateFormat;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import org.springframework.stereotype.Service;
//
//import com.saerok.jy.schedule.dao.ScheduleDao;
//import com.saerok.jy.schedule.dto.Schedule;
//
//@Service
//@Repository
//public class ScheduleServiceImpl implements ScheduleService{
//	
//	@Autowired
//	private  ScheduleDao skddao;
//	
//	@Autowired
//	private SqlSession session;
//	
//	//일정 작성
//	@Override
//	public int skdWrite(Schedule schedule) {
//		
//		int result = 0;
//		
//		try {
//		    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
//		    Date parsedSDate = dateFormat.parse(schedule.getStartDate());
//		    Date parsedEDate = dateFormat.parse(schedule.getEndDate());
//		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
//		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
//		    vo.setStartDate(timestamp.toString());
//		    vo.setEndDate(timestamp2.toString());
//		    
//		    
//		    result = skddao.insertCalendar(schedule);
//		} catch(Exception e) { 
//			e.printStackTrace();
//		}
//		
//		return result;
//		
//	}
//	
//	//캘린더에서 일정 작성
//	@Override
//	public int modalwrite(Schedule schedule) {
//		
//		int result = 0;
//		
//		try {
//		    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
//		    Date parsedSDate = dateFormat.parse(schedule.getStartDate());
//		    Date parsedEDate = dateFormat.parse(schedule.getEndDate());
//		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
//		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
//		    vo.setStartDate(timestamp.toString());
//		    vo.setEndDate(timestamp2.toString());
//		    
//		    
//		    result = skddao.insertModalCalendar(session, schedule);
//		} catch(Exception e) { 
//			e.printStackTrace();
//		}
//		
//		return result;
//	}
//
//	//일정 삭제
//	@Override
//	public int skdDelete(String empNo) {
//		return skddao.skdDelete(session, empNo);
//	}
//
//	//일정 수정
//	@Override
//	public int skdEdit(Schedule Schedule) {
//		int result = 0;
//		
//		try {
//		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
//		    Date parsedSDate = dateFormat.parse(Schedule);
//		    Date parsedEDate = dateFormat.parse(Schedule.getEndDate());
//		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
//		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
//		    schedule.setStartDate(timestamp.toString());
//		    schedule.setEndDate(timestamp2.toString());
//		    
//		    
//		    result = skddao.updateOne(session, Schedule);
//		} catch(Exception e) { 
//			e.printStackTrace();
//		}
//		
//		return result;
//	}
//
//	//일정 목록 조회
//	@Override
//	public List<CalendarVo> selectList(PageVo pv, EmployeeVo evo) {
//		return skddao.selectList(session, pv, evo);
//	}
//
//	//일정 갯수 조회
//	@Override
//	public int selectToatalCnt() {
//		return skddao.selectCountAll(session);
//	}
//
//	//일정 상세조회(번호)
//	@Override
//	public CalendarVo selectOne(String no) {
//		return skddao.selectOne(session, no);
//	}
//
//	//캘린더에서 일정보기
//	@Override
//	public List<CalendarVo> getCalendar(EmployeeVo evo) {
//		return skddao.getCalendar(session, evo);
//	}
//
//	//중요 일정 등록
//	@Override
//	public String star(CalendarVo cv) {
//		
//		String star = skddao.selectStar(session, cv);
//		String changeStar = "";
//		
//		if(star.equals("Y")) {
//			changeStar = "N";
//		}else {
//			changeStar = "Y";
//		}
//		cv.setStar(changeStar);
//		
//		skddao.updateStar(session, cv);
//		
//		return changeStar;
//	}
//
//	//중요 일정 목록 조회
//	@Override
//	public List<CalendarVo> selectStarList(PageVo pv, String no) {
//		return skddao.selectStarList(session, pv, no);
//	}
//
//
//
//	
//	
//
//}
