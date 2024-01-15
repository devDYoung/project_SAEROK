package com.saerok.dy.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")

public class BoardController {
	
	// 게시판 작성 페이지로 이동
	@GetMapping("/write")
	public String boardReadAllPage() {
		return "board/boardWrite";
	}

}
