package com.saerok.dy.note.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.saerok.dy.note.model.dto.Note;
import com.saerok.dy.note.model.service.NoteService;
import com.saerok.jh.employee.model.dto.Employee;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/note")

public class NoteController {

	@Autowired
	private final NoteService noteService;

	/*
	 * // 쪽지 쓰기 페이지로 이동
	 * 
	 * @GetMapping("/write") public String noteWritePage() { return
	 * "note/noteWrite"; }
	 */
	
	// 받은 쪽지함 페이지로 이동
	@GetMapping("/get")
	public String readNotePage(Model model) {
		List<Note> receivedNotes = noteService.getReceivedNotes();
		model.addAttribute("receivedNotes", receivedNotes);
		return "note/noteGet";
	}

	/*
	 * // 받은 쪽지함 처리
	 * 
	 * @PostMapping("/get/{noteNo}") public String getReceivedNotes(@PathVariable
	 * int sndEmpNo,String rcvEmpNo) {
	 */

	// 보낸 쪽지함 페이지로 이동
	@GetMapping("/send")
	public String sendNotePage(Model model) {
		return "note/noteSend";
	}

	// 휴지통 페이지로 이동
	@GetMapping("/basket")
	public String deleteNotePage(Model model) {
		return "note/noteBasket";
	}
	
	//이름으로 사원 조회
    @GetMapping("/selectEmpByName")
    @ResponseBody
    public Map selectEmpByName(Model model, HttpServletRequest request) {
    	 String empName = request.getParameter("empName");
		 List<Employee> empList = noteService.selectEmpByName(empName);
		 //log.debug("{}",empList);
		 //model.addAttribute("empList",empList);
		 
		 Map result = new HashMap();
		 result.put("empList", empList);
		 
		 return result;
    }
}
