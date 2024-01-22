package com.saerok.jy.schedule.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
@Repository
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private  ScheduleDao skddao;
	
	@Autowired
	private SqlSession session;
	
	//일정 작성
	@Override
	public int skdWrite(Schedule sc) {
		
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
	public int skdDelete(String no) {
		return skddao.skdDelete(session, no);
	}

	//일정 수정
	@Override
	public int skdEdit(Schedule sc) {
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
	public List<Schedule> selectList(PageFactory pf, String empNo) {
		return skddao.selectList(session, pf, empNo);
	}

	//일정 갯수 조회
	@Override
	public int selectTotalCnt() {
		return skddao.selectTotalAll(session);
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
	public String skdImpt(Schedule skd) {
		
		String star = skddao.insertImpt(session, skd);
		String changeStar = "";
		
		if(star.equals("Y")) {
			changeStar = "N";
		}else {
			changeStar = "Y";
		}
		skd.setSkdImpt(changeStar);
		
		skddao.updateImpt(session, skd);
		
		return changeStar;
	}
//
//	//중요 일정 목록 조회
//	@Override
//	public List<Schedule> selectImptList(PageFactory pf, String no) {
//		return skddao.selectImptList(session, pf, no);
//	}
//


	
	

}
