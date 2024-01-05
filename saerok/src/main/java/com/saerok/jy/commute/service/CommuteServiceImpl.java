package com.saerok.jy.commute.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saerok.jy.commute.dao.CommuteDao;
import com.saerok.jy.commute.dto.Commute;

@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Autowired
	private CommuteDao commuteDao;
	private SqlSession session;
	
	@Override
	public int insertStartWork(String empNo) {
		return commuteDao.insertStartWork(session,empNo);
	}
	
	@Override
	public int updateStartWork(Map<String, Object> param) {
		return commuteDao.updateStartWork(session, param);
	}
	
	@Override
	public Commute selectStartwork(String commuteNo) {
		return commuteDao.selectStartwork(session, commuteNo);
	}
	
	@Override
	public int checkStartwork(Map<String, Object> param) {
		return commuteDao.checkStartwork(session, param);
	}
	
	@Override
	public Commute checkWorkTime(Map<String, Object> param) {
		return commuteDao.checkWorkTime(session, param);
	}
	
	@Override
	public int updateEndWok(Map<String, Object> param) {
		return commuteDao.updateEndWork(session, param);
	}
	
	@Override
	public int updateDayWorkTime(Map<String, Object> param) {
		return commuteDao.updateDayWorkTime(session, param);
	}
	
	@Override
	public int updateDayWorkTimeHalf(Map<String, Object> param) {
		return commuteDao.updateDayWorkTimeHalf(session, param);
	}
	
	@Override
	public int insertRegDateState(Commute work) {
		return commuteDao.insertRegDateState(session, work);
	} // insertRegDateState() end
	
	
	@Override
	public List<Map<String, Object>> findByEmpIdNoDate(String empNo) {
		return commuteDao.findByEmpIdNoDate(session, empNo);
	} // findByEmpIdNoDate() end
	
	
	//test
	//test
//	@Autowired
//	private SqlSessionTemplate sqlSession;
//	
//	@Autowired
//	private HrDao hrDao;
//	
//	@Override
//	public ArrayList<Work> selectWorkList(Work work) {
//
//		ArrayList<Work> list = hrDao.selectWorkList(sqlSession, work);
//		
//		return list;
//	}
//	
//	@Override
//	public Work selectWork(int empNo) {
//		
//		Work w = hrDao.selectWork(sqlSession, empNo);
//		
//		return w;
//	}
//
//	@Override
//	public void insertWork(int empNo) {
//		
//		int result = hrDao.insertWork(sqlSession, empNo);
//		
//		if(result < 0) {
//			throw new CommException("출근 확인 실패");
//		}
//		
//	}
//
//	@Override
//	public void updateWork(String wNo) {
//		int result = hrDao.updateWork(sqlSession, wNo);
//		
//		if(result < 0) {
//			throw new CommException("퇴근 확인 실패");
//		}
//	}
//
//	@Override
//	public void insertWorkStatus(WorkSInfo wsi) {
//		int result = hrDao.insertWorkStatus(sqlSession, wsi);
//		
//		if(result < 0) {
//			throw new CommException("근무상태변경 실패");
//		}
//		
//	}
//
//	@Override
//	public VacationInfo selectVacationInfo(int empNo) {
//		
//		VacationInfo vi = hrDao.selectVacationInfo(sqlSession, empNo);
//		
//		return vi;
//	}
//
//	@Override
//	public ArrayList<VRequest> selectVRequestList(int empNo) {
//		
//		ArrayList<VRequest> vrList = hrDao.selectVRequestList(sqlSession, empNo);
//		
//		return vrList;
//	}
//
//	@Override
//	public ArrayList<VOccur> selectVOccurList(int empNo) {
//		
//		ArrayList<VOccur> voList = hrDao.selectVOccurList(sqlSession, empNo);
//		
//		return voList;
//	}
//
//	@Override
//	public EmpInfo selectEmpInfo(int empNo) {
//		
//		EmpInfo empInfo = hrDao.selectEmpInfo(sqlSession, empNo);
//		
//		return empInfo;
//	}
//
//	@Override
//	public ArrayList<WorkSInfo> selectWorkSInfoList(String wNo) {
//		
//		ArrayList<WorkSInfo> list = hrDao.selectWorkSInfoList(sqlSession, wNo);
//		
//		return list;
//	}

}
