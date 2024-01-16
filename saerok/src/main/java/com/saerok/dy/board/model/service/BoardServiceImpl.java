
package com.saerok.dy.board.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.saerok.dy.board.model.dao.BoardDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final BoardDao dao;
	private final SqlSession session;

}
