package com.saerok.dy.board.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.saerok.dy.board.model.dao.BoardDao;
import com.saerok.dy.board.model.dto.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardDao dao;
	private final SqlSession session;

	@Override
	public List<Board> boardAll() {
		return dao.boardAll(session);
	}

	@Override
	public List<Board> boardPart() {
		return dao.boardPart(session);
	}
	
	@Override
    public void save(Board board) {
        // 게시글을 DB에 저장하는 로직을 여기에 구현
        dao.save(board);
    }
}

