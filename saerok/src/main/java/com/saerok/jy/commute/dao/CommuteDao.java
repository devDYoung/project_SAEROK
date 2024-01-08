package com.saerok.jy.commute.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.saerok.jy.commute.dto.Commute;

public interface CommuteDao {
   
ArrayList<Commute> selectWorkList(SqlSession session, Commute commute);

int insertWork(SqlSession sessoin, String empNo);

Commute selectWork(SqlSession session, String empNo);

int updateWork(SqlSession session, int commuteNo);

public int insertWorkStatus(SqlSession session, String status);

}