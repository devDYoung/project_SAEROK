package com.saerok.jj.apv.model.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.jj.apv.model.dto.AppLetter;
import com.saerok.jj.apv.model.dto.Approval;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {

	@Override
	public List<Approval> selectApproval(SqlSession session, Map<String, Integer> page) {
		int cPage = page.get("cPage");
		int numPerpage = page.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1) * numPerpage, numPerpage);

		return session.selectList("approval.selectApproval", null, rb);
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
	//품의서 등록
	@Override
	public int insertApproval(SqlSession session, Approval a) {
		return session.insert("approval.insertApproval",a);
	}

	@Override
	public int insertAppLetter(SqlSession session, AppLetter appLetter) {
		return session.insert("approval.insertappLetter",appLetter);
	}

}
