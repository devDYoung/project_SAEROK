package com.saerok.dy.board.model.service;

import java.util.List;

import com.saerok.dy.board.model.dto.Board;

public interface BoardService {
    List<Board> getAllBoards();
    List<Board> getDepartmentBoards();
   
}
