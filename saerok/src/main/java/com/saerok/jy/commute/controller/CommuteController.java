package com.saerok.jy.commute.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.commute.dto.Commute;
import com.saerok.jy.commute.service.CommuteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CommuteController {

	@Autowired
	private CommuteService commuteService;

	@RequestMapping("/commuteCheck")
	public ModelAndView selectWorkList(HttpSession session, ModelAndView mv) {

		// 현재 로그인 중인 사원의 사원번호
		Employee loginEmployee = (Employee) session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginEmployee.getEmpNo());

		// 사원의 오늘 근무정보 가져오기
		Commute c = commuteService.selectWork(empNo);

		mv.addObject("c", c);
		mv.setViewName("/commute");

		return mv;
	}

	@ResponseBody
	@RequestMapping("/selectWorkList")
	public ModelAndView selectWorkList2(HttpSession session, ModelAndView mv, @RequestParam("year") int year,
			@RequestParam("month") int month, @RequestParam("empNo") int empNo) {

		String strYear = Integer.toString(year).substring(2);
		String strMonth = null;
		if (month < 10) {
			strMonth = "0" + month;
		} else {
			strMonth = Integer.toString(month);
		}

		String strDate = strYear + strMonth + "01";

		Commute commute = new Commute();
		commute.setEmpNo(Integer.toString(empNo));
		commute.setWorkingDay(strDate);

		// 사원의 이번달 근무정보 가져오기
		ArrayList<Commute> clist = commuteService.selectWorkList(commute);

		mv.addObject("clist", clist);

		mv.addObject("year", year);
		mv.addObject("month", month);

		mv.setViewName("/commuteList");

		return mv;

	}

	@RequestMapping("/changeWorkStatus")
	public void changeWorkStatus(Model model, HttpSession session, HttpServletRequest request) {
		
		//사원번호
		Employee loginEmployee = (Employee)session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginEmployee.getEmpNo());
		
		//상태코드
		int sCode = Integer.parseInt(request.getParameter("status"));

		//근무번호
		int commuteNo = Integer.parseInt(request.getParameter(" commuteNo"));
		if(commuteNo == 0) {
			 commuteNo = 0;
		}
		
		//출근 일때,
		if(sCode==1) {
			commuteService.insertWork(empNo);
			
		}
		//퇴근 일때
		else if(sCode==2) {
			
			commuteService.updateWork(commuteNo);
		}

	}
}
