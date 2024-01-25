package com.saerok.jj.apv.model.dao;

import java.util.List;
import java.util.Map;

import com.saerok.jj.apv.model.dto.Approval;

import jakarta.servlet.http.HttpSession;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jj.apv.model.dto.AppLetter;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

public interface ApprovalDao {

	List<Approval> selectApproval(SqlSession session);

	Approval selectApprovalByNo(SqlSession session, String appKinds);

	List<Map<String, Object>> selectEmployeeList(SqlSession session, Integer deptCode);

	int insertApproval(SqlSession session, Approval a);

	int insertAppLetter(AppLetter appLetter, SqlSession session);
	
	int insertAppr(SqlSession session, AppLetter approval);
	
	int insertApprovalLine(SqlSession session, Map approvalList);
	
	
	// 내 문서함 조회
	List<Approval> myApproval(SqlSession session, String empNo);
	List<Approval> myTodoApprovalList(SqlSession session, String empNo);
	
}
