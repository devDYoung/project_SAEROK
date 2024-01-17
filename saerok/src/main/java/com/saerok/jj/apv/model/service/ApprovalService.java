package com.saerok.jj.apv.model.service;

import java.util.List;
import java.util.Map;

import com.saerok.jj.apv.model.dto.Approval;
import com.saerok.jj.apv.model.dto.AppLetter;

public interface ApprovalService {
	
	List<Approval> selectApproval(Map<String, Integer> page);
	
	Approval selectApprovalByNo(String apvDocNo);
	
	int insertApproval(Approval a);
	
	List<Map<String,Object>> deptName(Integer deptCode);
}

