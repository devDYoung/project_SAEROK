package com.saerok.jy.commute.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.jy.commute.dto.Commute;

@Repository
public class CommuteDaoImpl implements CommuteDao {

	@Override
	public ArrayList<Commute> selectCommuteList(SqlSession session, Commute commute) {
		return (ArrayList) session.selectList("commute.selectCommuteList", commute);
	}

	@Override
	public int insertCommute(SqlSession session, String empNo) {
		return session.insert("commute.insertCommute", empNo);
	}

	@Override
	public Commute selectCommute(SqlSession session, String empNo) {
		return (Commute) session.selectOne("commute.selectCommute", empNo);
	}

	@Override
	public int updateCommute(SqlSession session, int commuteNo) {
		return session.update("commute.updateCommute", commuteNo);
	}

	@Override
	public int insertCommuteStatus(SqlSession session, String status) {

		return session.insert("commute.insertCommuteStatus", status);
	}

	@Override
	public ArrayList<Commute> selectCommuteStatusList(SqlSession session, int commuteNo) {

		return (ArrayList) session.selectList("commute.selectCommuteStatusList", commuteNo);
	}

}
