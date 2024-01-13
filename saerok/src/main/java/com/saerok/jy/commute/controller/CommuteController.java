package com.saerok.jy.commute.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saerok.jy.commute.dto.Commute;
import com.saerok.jy.commute.service.CommuteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
//@RequiredArgsConstructor
@RequestMapping("/commute")
public class CommuteController {

	@Autowired
	private CommuteService commuteService;
	
	DateTimeFormatter dayff = DateTimeFormatter.ofPattern("yy-MM"); //날짜 패턴 변경
	DateTimeFormatter dayfff = DateTimeFormatter.ofPattern("yy/MM"); //날짜 패턴 변경
	DateTimeFormatter dayf = DateTimeFormatter.ofPattern("yy-MM-dd"); //날짜 패턴 변경
	LocalDateTime now = LocalDateTime.now(); //현재 시간
	
	// 금일 근무 기록 조회
	@PostMapping("/commute.do")
	public ResponseEntity<Commute> selectCommuteList(HttpSession session, ModelAndView mv, Principal loginSession) {

		// 현재 로그인 중인 사원의 사원번호
		String empNo = loginSession.getName();
		String time = now.format(dayf); //현재날짜를 yy/MM/dd 형식으로 변경
		 Map<String,Object> param = new HashMap<>();
		 param.put("empNo", empNo);
		 param.put("time", time);
		
		 Commute commute = commuteService.selectCommuteList(param);
		 
		 return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON.toString())
					.body(commute);
		
		
	}

//	@GetMapping("/selectCommuteList.do")
//	public ModelAndView selectCommuteList2(HttpSession session, ModelAndView mv, @RequestParam("year") int year,
//			@RequestParam("month") int month, @RequestParam("empNo") String empNo) {
//
//		Commute commute = new Commute();
//		commute.setEmpNo(empNo);
//
//		// 사원의 이번달 근무정보 가져오기
//		ArrayList<Commute> clist = commuteService.selectCommuteList(commute);
//
//		mv.addObject("clist", clist);
//		mv.addObject("year", year);
//		mv.addObject("month", month);
//		mv.setViewName("commute/commuteList");
//
//		return mv;
//
//	}

	// 출퇴근버튼 눌렀을 때
	@PostMapping("/workIn.do")
    @ResponseBody
	public Map<String, Object> workIn(Model model, HttpSession session, HttpServletRequest request, Principal loginSession) {
		// 사원번호
		String empNo = loginSession.getName();

		// 상태
		String status = request.getParameter("status");
		LocalDateTime checkDate = LocalDateTime.now();
		String time = now.format(dayf);
		Map param = new HashMap();
		param.put("status", status);
		param.put("empNo", empNo);
		
		//Commute commute = commuteService.selectCommuteList(param);
		
		String lateYN = "N";
		if (checkDate.getHour() > 9) {
			lateYN = "Y";
		} 
		param.put(lateYN, lateYN);

		int result = commuteService.insertCommuteStatus(param);
		Map<String, Object> returnResult =  new HashMap<>();
		returnResult.put("lateYN", lateYN);
		if(result > 0) {
			returnResult.put("successYn", "Y");
			returnResult.put("indtime",
					new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss")
					.format((Date)param.get("indtime")));
		}else {
			returnResult.put("successYn", "N");
		}
		return returnResult;
		
	}
		
	
	@PostMapping("/workOut.do")
	@ResponseBody
	public Map<String, Object> workOut(Model model, HttpSession session, HttpServletRequest request, Principal loginSession) {
	    // 사원번호
	    String empNo = loginSession.getName();
	    
	    // 퇴근 시간 설정
	    String status = request.getParameter("status");
	    LocalDateTime checkDate = LocalDateTime.now();
	    Map param = new HashMap();
	    param.put("status", "20"); 
	    param.put("empNo", empNo);
	   
	    int result = commuteService.updateCommuteEndTime(param); // 퇴근 시간 업데이트
	    
	    Map<String, Object> returnResult =  new HashMap<>();
	    if (result > 0) {
	        returnResult.put("successYn", "Y");
	       // returnResult.put("outTime", checkDate.toString()); // 퇴근 시간 반환
	        returnResult.put("outdtime", new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss")
					.format((Date)param.get("outdtime")));
	    } else {
	        returnResult.put("successYn", "N");
	    }

	    return returnResult;
	}
	
	
	

}
