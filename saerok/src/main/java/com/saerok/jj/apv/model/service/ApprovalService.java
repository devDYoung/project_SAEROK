package com.saerok.jj.apv.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.jj.apv.model.dto.Approval;

import jakarta.servlet.http.HttpSession;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jj.apv.model.dto.AppLetter;

public interface ApprovalService {

	List<Approval> selectApproval();

	Approval selectApprovalByNo(String empNo);

	List<Map<String, Object>> deptName(Integer deptCode);

	int insertAppLetter(AppLetter appLetter, List<Map> approvalList);

	// 내 문서함 조회
	List<Approval> myApproval(String empNo);
	
	List<Approval> myTodoApprovalList(String empNo);
	
	Approval approvalDetailView(String appSeq); //품의서 상세조회 결재

}
