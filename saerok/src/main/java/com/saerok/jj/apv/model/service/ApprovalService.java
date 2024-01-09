package com.saerok.jj.apv.model.service;

import java.util.List;
import java.util.Map;

import com.saerok.jj.apv.model.dto.Approval;

public interface ApprovalService {
	
	List<Approval> selectApproval(Map<String, Integer> page);
	
	Approval selectApprovalByNo(int apvNo);
	
	int insertApproval(Approval a);
}
