package com.saerok.jj.apv.model.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jj.apv.model.dto.AppLetter;
import com.saerok.jj.apv.model.dto.Approval;

import jakarta.servlet.http.HttpSession;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {

	@Override
	public List<Approval> selectApproval(SqlSession session) {

		return session.selectList("approval.selectApproval");
	}

	@Override
	public Approval selectApprovalByNo(SqlSession session, String appKinds) {

		return session.selectOne("approval.selectApprovalByNo", appKinds);
	}

	// 결재선 리스트 불러오기
	@Override
	public List<Map<String, Object>> selectEmployeeList(SqlSession session, Integer deptCode) {
		// TODO Auto-generated method stub
		return session.selectList("approval.selectEmployeeByDeptName", deptCode);
	}

	// 품의서 등록

	@Override
	public int insertApproval(SqlSession session, Approval a) {
		return session.insert("approval.insertApproval", a);
	}

	@Override
	public int insertAppLetter(MultipartFile upFile, AppLetter appLetter, SqlSession session) {
		return session.insert("approval.insertAppLetter", appLetter);
	}


}
