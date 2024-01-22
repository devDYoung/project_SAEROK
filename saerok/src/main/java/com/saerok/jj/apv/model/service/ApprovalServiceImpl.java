package com.saerok.jj.apv.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.jh.employee.model.dao.EmployeeDao;
import com.saerok.jj.apv.model.dao.ApprovalDao;
import com.saerok.jj.apv.model.dto.Approval;

import jakarta.servlet.http.HttpSession;

import com.saerok.jj.apv.model.dto.AppLetter;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ApprovalServiceImpl implements ApprovalService {

	private final SqlSession session;

	private final ApprovalDao dao;

	@Override
	public List<Approval> selectApproval() {
		// TODO Auto-generated method stub
		return dao.selectApproval(session);
	}

	@Override
	public Approval selectApprovalByNo(String appKinds) {
		// TODO Auto-generated method stub
		return dao.selectApprovalByNo(session, appKinds);
	}

	@Override
	public List<Map<String, Object>> deptName(Integer deptCode) {
		// TODO Auto-generated method stub
		return dao.selectEmployeeList(session, deptCode);
	}

	@Override
	@Transactional
	public int insertAppLetter(AppLetter appLetter,List<Map> approvalList) {
		//1. 전자결재 table등록
		int result=dao.insertAppr(session, appLetter);
		//2. 종류별 내용등록(품의서, 휴가서, )
		if(result>0) {
			result=dao.insertAppLetter(appLetter, session);
		}
		
		//3. 결재선 
		if(result>0) {
			approvalList.stream().forEach(e->{
				dao.insertApprovalLine(session, e);
			});
			
		}
		
		return result;
	}

}