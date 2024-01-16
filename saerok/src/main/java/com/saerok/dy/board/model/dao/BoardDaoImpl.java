
package com.saerok.dy.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.dy.board.model.dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	// 공지사항 조회
	@Override
	public List<Board> boardReadAll(SqlSession session){
		return session.selectList("board.boardReadAll");
	}
}
