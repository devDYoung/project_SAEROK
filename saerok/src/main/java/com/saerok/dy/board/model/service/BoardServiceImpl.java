package com.saerok.dy.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saerok.dy.board.model.dao.BoardDao;
import com.saerok.dy.board.model.dto.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private final BoardDao boardDao;

	public BoardServiceImpl(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<Board> getAllBoards() {
		return boardDao.boardAll(null);
	}

	@Override
	public List<Board> getDepartmentBoards() {
		return boardDao.boardPart(null);
	}
}
