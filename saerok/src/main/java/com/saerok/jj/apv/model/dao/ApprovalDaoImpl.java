package com.saerok.jj.apv.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.jj.apv.model.dto.Approval;
import com.saerok.jj.apv.model.dto.CDocForm;
@Repository
public class ApprovalDaoImpl implements ApprovalDao {

	

	@Override
	public List<Approval> selectApproval(SqlSession session,Map<String, Integer> page) {
		int cPage=page.get("cPage");
		int numPerpage=page.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		
		return session.selectList("approval.selectApproval",null,rb);
	}

	@Override
	public Approval selectApprovalByNo(SqlSession session, String DocNo) {
	
		return session.selectOne("approval.selectApprovalByNo",DocNo);
	}

	
	
}
