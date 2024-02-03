package com.saerok.dy.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.saerok.dy.board.model.dto.Board;
import com.saerok.dy.board.model.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
// 일일히 board 써주는 귀찮음 해소
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private final BoardService boardService;

    // 공지사항 페이지로 이동
    @GetMapping("/noticelist")
    public String noticeList(Model model) {
        List<Board> noticeList = boardService.noticeList();
        model.addAttribute("noticeList", noticeList);
        return "notice/noticeList";
    }

    // 공지사항 상세보기 페이지
    @GetMapping("/noticeview")
    public String selectNoticeByNo(@RequestParam int boardNo, Model model) {
        // 게시글 상세보기 로직
        Board board = boardService.selectNoticeByNo(boardNo);
        model.addAttribute("b", board);
        return "notice/noticeView";
    }

    // 공지사항 작성 페이지로 이동
    @GetMapping("/noticewrite")
    public String noticeWrite() {
        return "notice/noticeWrite";
    }

    // 게시글 저장
    @PostMapping("/save")
    public String saveBoard(@ModelAttribute Board board, Model model) {
        // 현재 로그인 중인 사원의 사원번호
        String empNo = SecurityContextHolder.getContext().getAuthentication().getName();
        board.setRegId(empNo);
        model.addAttribute("content", board.getBoardContent());
        // 게시글 저장 로직 수행
        try {
        	boardService.save(board);
        	model.addAttribute("msg","게시글을 등록하였습니다.");
        	model.addAttribute("loc","board/noticelist");
        }catch(Exception e) {
        	model.addAttribute("msg","게시글을 다시 작성해주세요.");
        	model.addAttribute("loc","board/noticewrite");
        }
        return "common/msg";
    }
}
