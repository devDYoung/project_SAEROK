package com.saerok.jj.apv.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.jj.apv.model.dto.Approval;

import jakarta.servlet.http.HttpSession;

import com.saerok.jj.apv.model.dto.AppLetter;

public interface ApprovalService {

	List<Approval> selectApproval();

	Approval selectApprovalByNo(String apvDocNo);

	List<Map<String, Object>> deptName(Integer deptCode);



	int insertAppLetter(MultipartFile upFile, AppLetter appLetter);
}
