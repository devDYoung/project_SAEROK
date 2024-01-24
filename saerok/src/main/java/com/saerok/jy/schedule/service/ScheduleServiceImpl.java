package com.saerok.jy.schedule.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dao.ScheduleDao;
import com.saerok.jy.schedule.dto.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private  ScheduleDao skddao;
	
	@Autowired
	private SqlSession session;
	
	//일정 작성
	@Override
	public int write(Schedule sc) {
		
		int result = 0;
		
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
		    Date parsedSDate = dateFormat.parse(sc.getSkdStart());
		    Date parsedEDate = dateFormat.parse(sc.getSkdEnd());
		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
		    sc.setSkdStart(timestamp.toString());
		    sc.setSkdEnd(timestamp2.toString());
		    
		    
		    result = skddao.insertSkd(session, sc);
		} catch(Exception e) { 
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	//캘린더에서 일정 작성
	@Override
	public int modalwrite(Schedule sc) {
		
		int result = 0;
		
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
		    Date parsedSDate = dateFormat.parse(sc.getSkdStart());
		    Date parsedEDate = dateFormat.parse(sc.getSkdEnd());
		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
		    sc.setSkdStart(timestamp.toString());
		    sc.setSkdEnd(timestamp2.toString());
		    
		    
		    result = skddao.insertModalSkd(session, sc);
		} catch(Exception e) { 
			e.printStackTrace();
		}
		
		return result;
	}
	//일정 삭제
	@Override
	public int delete(String no) {
		return skddao.delete(session, no);
	}

	//일정 수정
	@Override
	public int edit(Schedule sc) {
		int result = 0;
		
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		    Date parsedSDate = dateFormat.parse(sc.getSkdStart());
		    Date parsedEDate = dateFormat.parse(sc.getSkdEnd());
		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
		    sc.setSkdStart(timestamp.toString());
		    sc.setSkdEnd(timestamp2.toString());
		    
		    
		    result = skddao.updateOne(session, sc);
		} catch(Exception e) { 
			e.printStackTrace();
		}
		
		return result;
	}

	//일정 목록 조회
	@Override
	public List<Schedule> selectList(String empNo) {
		return skddao.selectList(session,empNo);
	}

	//일정 갯수 조회
	@Override
	public int selectTotalCnt() {
		return skddao.selectCountAll(session);
	}

	//일정 상세조회(번호)
	@Override
	public Schedule selectOne(String no) {
		return skddao.selectOne(session, no);
	}

	//캘린더에서 일정보기
	@Override
	public List<Schedule> getSchedule(String empNo) {
		return skddao.getSchedule(session, empNo);
	}

	//중요 일정 등록
	@Override
	public String star(Schedule skd) {
		
		String star = skddao.selectStar(session, skd);
		String changeStar = "";
		
		if(star.equals("Y")) {
			changeStar = "N";
		}else {
			changeStar = "Y";
		}
		skd.setStar(changeStar);
		
		skddao.updateStar(session, skd);
		
		return changeStar;
	}

	//중요 일정 목록 조회
	@Override
	public List<Schedule> selectStarList(String no) {
		return skddao.selectStarList(session, no);
	}


	
//	// 오늘 날짜의 모든 일정 조회(홈)
//	public List<Schedule> selectTodaySchedule(String empNo){
//		String todayYmd = LocalDate.now().toString();
//		return skddao.selectTodaySchedule(session, empNo, todayYmd);
//	}
//	
//	// 해당 달의 일정 목록 조회
//	public List<Schedule>  selectMonthSchedule(String empNo){
//		return skddao.selectMonthSchedule(session, empNo);
//	}
//	
//	// 회사/부서/개인 일정
//	public List<Schedule> selectFilteredMonthSchedule(String empNo, String skdTypeCd) {
//		// 회사 일정 조회
//	    if ("00".equals(skdTypeCd)) {
//	        return skddao.selectAdminSchedule(session);
//	        // 개인 일정 조회
//	    } else if ("99".equals(skdTypeCd)) {
//	        return skddao.selectPersonalSchedule(session, empNo);
//	        // 부서별 일정 조회
//	    } else {
//	        return skddao.selectDeptSchedule(session, empNo);
//	    }
//	}
//	
//	// 관리자 일정만
//	public List<Schedule>  selectAdminSchedule() {
//		return skddao.selectAdminSchedule(session);
//	}
//	
//	// 선택한 일정 조회
//	public Schedule selectDateSchedule(int scheduleNo){
//		return skddao.selectDateSchedule(session, scheduleNo);
//	}
//	
//	// 일정 등록
//	public int insertSchedule(Schedule schedule) {
//		return skddao.insertSchedule(session, schedule);
//	}
//	
//	// 등록시 사용자 부서 세팅
//	public String setUserDept(String empNo){
//		return skddao.setUserDept(session, empNo);
//	}
//	
//	// 일정 수정
//	public int modifySchedule(Schedule schdule) {
//		//log.debug("\u001B[41m" + "service modifySchedule schdule : " + schdule + "\u001B[0m");
//		return skddao.modifySchedule(session, schdule);
//	}
//	
//	// 일정 삭제
//	public int deleteSchedule(int scheduleNo) {
//		return skddao.deleteSchedule(session, scheduleNo);
//	}
//
//	@Override
//	public List<Schedule> selectTodaySchedule(String empNo, String todayYmd) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<Schedule> selectPersonalSchedule(String empNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<Schedule> selectDeptSchedule(String empNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}


	
	

}
