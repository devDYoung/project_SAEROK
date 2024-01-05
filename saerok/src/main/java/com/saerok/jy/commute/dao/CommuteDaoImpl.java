package com.saerok.jy.commute.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.jy.commute.dto.Commute;

@Repository
public class CommuteDaoImpl implements CommuteDao{
    @Override
    public ArrayList<Commute> selectWorkList(SqlSession session, Commute commute){
    return (ArrayList)session.selectList("commute.selectWorkList",commute);
    }
    
    @Override
    public int insertWork(SqlSession session, int empNo) {
    	return session.insert("commute",empNo);
    }
    
    
    @Override
    public Commute selectWork(SqlSession session, int empNo) {
    	return (Commute)session.selectOne("commute.selectCommute",empNo);
    }
    
    @Override
    public int updateWork(SqlSession session, int commuteNo) {
    	return session.update("commute", commuteNo);
    }
    

    
    

}
