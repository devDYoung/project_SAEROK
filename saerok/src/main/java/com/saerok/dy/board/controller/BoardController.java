
package com.saerok.dy.board.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.saerok.dy.board.model.dto.Board;
import com.saerok.dy.board.model.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller

@RequiredArgsConstructor

@RequestMapping("/board")

public class BoardController {

   @Autowired
   private final BoardService boardService;

   // 공지사항 페이지로 이동
   @GetMapping("/noticelist")
   public String noticeList(Model model) {
      List<Board> noticeList=boardService.noticeList();
      model.addAttribute("noticeList",noticeList);
      return "notice/noticeList";
   }
   
   //공지사항 상세보기 페이지
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
   
   //공지사항 작성
  // @PostMapping("/noticewrite/insert")
  // public String insertNotice() {
	   
  // }
   
   // 부서별 게시판 페이지로 이동
   @GetMapping("/Part")
   public String boardPart(Model model) {
      List<Board> boardPart=boardService.boardPart();
      model.addAttribute("boardPart",boardPart);
      return "board/boardPart";
   }
   
  


   // 이미지 업로드 처리
//   @PostMapping("/imageUpload.do")
//   @ResponseBody
//   public String handleImageUpload(MultipartFile file) {
//      // 이미지 업로드 로직을 구현
//      // 성공 시 이미지 URL을 반환하도록 수정
//      // 실패 시 에러 메시지를 반환하도록 수정
//      return "success";
//   }
//   

   // 게시글 저장
   @PostMapping("/save")
   public String saveBoard(Board board, Principal loginSession) {

      // 현재 로그인 중인 사원의 사원번호
      String empNo = loginSession.getName();
      board.setRegId(empNo);
      
      boardService.save(board);
      return "redirect:/board/noticelist";
   }
}
