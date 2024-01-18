
package com.saerok.dy.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.saerok.dy.board.model.dto.Board;

public interface BoardDao {

	// 공지사항 조회
	List<Board> boardAll(SqlSession session);

	List<Board> boardPart(SqlSession session);
	
	void save(Board board);

}
