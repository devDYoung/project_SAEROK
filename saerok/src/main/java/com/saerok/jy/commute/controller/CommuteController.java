package com.saerok.jy.commute.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.commute.dto.Commute;
import com.saerok.jy.commute.service.CommuteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
//@RequiredArgsConstructor
//@RequestMapping("/commute")
public class CommuteController {

	@Autowired
	private CommuteService commuteService;


	@GetMapping("commute.do")
	public ModelAndView selectCommuteList(HttpSession session, ModelAndView mv) {

		// 현재 로그인 중인 사원의 사원번호
		Employee loginEmployee = (Employee) session.getAttribute("loginEmployee");
		String empNo = loginEmployee.getEmpNo();

		// 사원의 오늘 근무정보 가져오기
		Commute c = commuteService.selectCommute(empNo);

		mv.addObject("c", c);
		mv.setViewName("commute/commuteMain");

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
	    commute.setStrDate(strDate);

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

	@GetMapping("changeStatus.do")
	public String changeCommuteStatus(Model model, HttpSession session, HttpServletRequest request) {

		// 사원번호
		Employee loginEmployee = (Employee) session.getAttribute("loginEmployee");
		String empNo = loginEmployee.getEmpNo();

		// 상태
		String status = request.getParameter("status");

		// 근무번호
		int commuteNo = Integer.parseInt(request.getParameter("commuteNo"));
		if (commuteNo == 0) {
			commuteNo = 0;
		}

		// 출근 일때,
		if (status.equals("Y")) {
			commuteService.insertCommute(empNo);

		}
		// 퇴근 일때
		else if (status.equals("N")) {
			commuteService.updateCommute(commuteNo);
		}

		// 모든 상태 추가
		Commute commute = new Commute(commuteNo, null, null, status, status, commuteNo, status, status, status);
		commuteService.insertCommuteStatus(status);

		if (request.getParameter("index").equals("1")) {
			Commute c = commuteService.selectCommute(empNo);

			model.addAttribute("c", c);
			return "index";
		} else {
			return "redirect:commute.do";
		}

	}
	
	// 상태조회
	@ResponseBody
	@GetMapping(value = "selectCommuteStatus.do", produces = "application/json; charset=utf-8")
	public String selectCommuteStatusList(@RequestParam("commuteNo") int commuteNo) {
		ArrayList<Commute> list = commuteService.selectCommuteStatusList(commuteNo);
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
}
}
