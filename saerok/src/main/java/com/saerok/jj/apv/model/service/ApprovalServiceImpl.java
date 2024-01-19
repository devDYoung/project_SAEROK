package com.saerok.jj.apv.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saerok.jh.employee.model.dao.EmployeeDao;
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
	public Approval selectApprovalByNo(String appKinds) {
		// TODO Auto-generated method stub
		return dao.selectApprovalByNo(session, appKinds);
	}

	@Override
	public List<Map<String, Object>> deptName(Integer deptCode) {
		// TODO Auto-generated method stub
		return dao.selectEmployeeList(session, deptCode);
	}

	@Override
	@Transactional
	public int insertApproval(Approval a) {
		//품의서 저장하기
		int result=dao.insertApproval(session, a);
			if(result>0) {
				if(a.getFile().size()>0) {
					a.getFile().forEach(file->{
						file.setLetterSeq(a.getAppSeq());
						int fileResult=dao.insertAppLetter(session, file);
						if(fileResult==0)throw new RuntimeException("첨부파일 등록실패");
					});
				}
			}else {
				throw new RuntimeException("첨부파일 등록실패");
			}
		return result;
	}

}