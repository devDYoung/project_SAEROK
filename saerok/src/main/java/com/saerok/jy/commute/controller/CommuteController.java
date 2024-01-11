package com.saerok.jy.commute.controller;

import java.security.Principal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.saerok.jy.commute.dto.Commute;
import com.saerok.jy.commute.service.CommuteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RestController
//@RequiredArgsConstructor
//@RequestMapping("/commute")
public class CommuteController {

	@Autowired
	private CommuteService commuteService;

	
	// 근무정보 조회하기
	@GetMapping("commute.do")
	public ModelAndView selectCommuteList(HttpSession session, ModelAndView mv, Principal loginSession) {

		// 현재 로그인 중인 사원의 사원번호
		//Employee loginEmployee = (Employee) session.getAttribute("loginEmployee");
		String empNo = loginSession.getName();

		// 사원의 오늘 근무정보 가져오기
		Commute c = commuteService.selectCommute(empNo);

		mv.addObject("c", c);
		mv.setViewName("commute/commuteMain"); // 보여줄 화면 : commuteMain.jsp

		return mv;
	}

	@ResponseBody
	@GetMapping("selectCommuteList.do")
	public ModelAndView selectCommuteList2(HttpSession session, ModelAndView mv, @RequestParam("year") int year,
			@RequestParam("month") int month, @RequestParam("empNo") String empNo) {

//		String strYear = String.valueOf(year).substring(2);
		
		String strYear =Integer.toString(year).substring(2);
		String strMonth = null;
		if(month <10) {
			strMonth ="0 "+month;
		}
		else {
			strMonth = Integer.toString(month);
		}
	
//		String strMonth = (month < 10) ? "0" + month : String.valueOf(month);

		String strDate = strYear + strMonth + "01";
//		Commute commute = new Commute(month, null, null, empNo, strDate, month, strDate, strDate, strDate);
		
		  Commute commute = new Commute();
		  commute.setEmpNo(empNo);

		// 사원의 이번달 근무정보 가져오기
		ArrayList<Commute> clist = commuteService.selectCommuteList(commute);
		
		// 날짜 포맷팅 추가
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String formattedInDtime = sdf.format(commute.getInDtime());
//	    for (Commute c : clist) {
//	        // 출근일시 포맷팅
//	        if (c.getInDtime() != null) {
//	            c.setInDtime(sdf.format(c.getInDtime()));
//	        }
//	        // 퇴근일시 포맷팅
//	        if (c.getOutDtime() != null) {
//	            c.setOutDtime(sdf.format(c.getOutDtime()));
//	        }
//	    }

		mv.addObject("clist", clist);
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.setViewName("commute/commuteList");

		return mv;

	}

	
	//출퇴근버튼 눌렀을 때 
	@GetMapping("changeStatus.do")
	public String changeCommuteStatus(Model model, HttpSession session, HttpServletRequest request, Principal loginSession) {
		 // 사원번호
	   // Employee loginEmployee = (Employee) session.getAttribute("loginEmployee");
		String empNo = loginSession.getName();
		
	    // 상태
	    String status = request.getParameter("status");
	    LocalDateTime checkDate=LocalDateTime.now();
//	    if(checkDate.getHour()<9) {
//	    	status="10";
//	    }else if(){
//	    	
//	    }else {
//	    	status="30";
//	    }
	    // 근무번호
	    String commuteNoStr = request.getParameter("commuteNo");
//	    int commuteNo = 0; // 초기값 0으로 설정
//	    if (commuteNoStr != null && !commuteNoStr.isEmpty()) {
//	        commuteNo = Integer.parseInt(commuteNoStr);
//	    }

	    // 출근 일때 Y
//	    if (status.equals("Y")) {
//	        commuteService.insertCommute(empNo);
//	    }
//	    // 퇴근 일때 N
//	    else if (status.equals("N")) {
//	        if (commuteNo != 0) { // commuteNo가 0이 아닌 경우에만 퇴근 처리
//	            commuteService.updateCommute(commuteNo);
//	        }
//	    }

		 // 모든 상태 추가
//	    Commute commute = new Commute();
//	    commute.setCommuteNo(commuteNo);
//	    commute.setStatus(status);
	    commuteService.insertCommuteStatus(Map.of("status",status,"empNo",empNo));

	    if ("1".equals(request.getParameter("index"))) {
	        Commute c = commuteService.selectCommute(empNo);
	        model.addAttribute("c", c);
	        return "index"; // index 값이 1이면, index로 반환
	    } else {
	        return "redirect:commute.do"; // 아니면 commute.do -> commuteMain으로 이동
	    }
	}
	
	// 근무상태조회
	// commuteNo를 전달하면 해당하는 근무 상태 리스트 json으로 반환
	@GetMapping(value = "selectCommuteStatus.do", produces = "application/json; charset=utf-8")
	public String selectCommuteStatusList(@RequestParam("commuteNo") int commuteNo) {
		ArrayList<Commute> list = commuteService.selectCommuteStatusList(commuteNo); // 근무리스트 조회
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
}
}
