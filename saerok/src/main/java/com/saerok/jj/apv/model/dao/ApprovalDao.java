package com.saerok.jj.apv.model.dao;

import java.util.List;
import java.util.Map;

import com.saerok.jj.apv.model.dto.Approval;
import com.saerok.jj.apv.model.dto.AppLetter;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

public interface ApprovalDao {
	
	
	List<Approval> selectApproval(SqlSession session, Map<String, Integer> page);
	
	Approval selectApprovalByNo(SqlSession session, String DocNo);

	

	int insertApproval(SqlSession session, Approval a);
}

	

