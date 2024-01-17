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
	public List<Board> boardAll(int boardNo) {
		return dao.boardAll(session);
	}

	@Override
	public List<Board> getDepartmentBoards() {
		return dao.boardPart(null);
	}
}
