package com.saerok.jj.apv.model.dao;

import java.util.List;
import java.util.Map;

import com.saerok.jj.apv.model.dto.Approval;

import org.apache.ibatis.session.SqlSession;

public interface ApprovalDao {
	
	
	List<Approval> selectApproval(SqlSession session, Map<String, Integer> page);
	
	Approval selectApprovalByNo(SqlSession session, long apvNo);
	
	int insertApproval(SqlSession session, Approval a);
}
