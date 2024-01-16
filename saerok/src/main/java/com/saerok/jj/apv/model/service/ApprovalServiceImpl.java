package com.saerok.jj.apv.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saerok.jj.apv.model.dao.ApprovalDao;
import com.saerok.jj.apv.model.dto.Approval;
import com.saerok.jj.apv.model.dto.AppLetter;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class ApprovalServiceImpl implements ApprovalService {
	
	private final SqlSession session;
	
	private final ApprovalDao dao;
	
	
	
	
	@Override
	public List<Approval> selectApproval(Map<String, Integer> page) {
		// TODO Auto-generated method stub
		return dao.selectApproval(session, page);
	}

	@Override
	public Approval selectApprovalByNo(String DocNo) {
		// TODO Auto-generated method stub
		return dao.selectApprovalByNo(session, DocNo);
	}

	@Override
	public int insertApproval(Approval a) {
		// TODO Auto-generated method stub
		return 0;
	}


}