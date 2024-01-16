
package com.saerok.dy.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.dy.board.model.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller

@RequiredArgsConstructor

@RequestMapping("/board")

public class BoardController {

	@Autowired
	private final BoardService boardService;

	// 게시판 작성 페이지로 이동
	@GetMapping("/write")
	public String boardAll() {
		return "board/boardWrite";
	}

	// 이미지 업로드 처리
	@PostMapping("/imageUpload.do")
	@ResponseBody
	public String handleImageUpload(MultipartFile file) {
		// 이미지 업로드 로직을 구현
		// 성공 시 이미지 URL을 반환하도록 수정
		// 실패 시 에러 메시지를 반환하도록 수정
		return "success";
	}
}
