package com.saerok.jy.commute.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.commute.dto.Commute;
import com.saerok.jy.commute.service.CommuteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CommuteController {

	@Autowired
	private CommuteService commuteService;

	@GetMapping("/commuteCheck")
	public ModelAndView selectWorkList(HttpSession session, ModelAndView mv) {

		// 현재 로그인 중인 사원의 사원번호
		Employee loginEmployee = (Employee) session.getAttribute("loginEmployee");
		String empNo = loginEmployee.getEmpNo();

		// 사원의 오늘 근무정보 가져오기
		Commute c = commuteService.selectWork(empNo);

		mv.addObject("c", c);
		mv.setViewName("/commute/commuteMain");

		return mv;
	}

	@ResponseBody
	@PostMapping("/selectCommuteList")
	public ModelAndView selectWorkList2(HttpSession session, ModelAndView mv, @RequestParam("year") int year,
			@RequestParam("month") int month, @RequestParam("empNo") int empNo) {

		String strYear = String.valueOf(year).substring(2);
		String strMonth = (month < 10) ? "0" + month : String.valueOf(month);

		String strDate = strYear + strMonth + "01";

		Commute commute = new Commute();
		commute.setEmpNo(String.valueOf(empNo));
		commute.setWorkingDay(strDate);

		// 사원의 이번달 근무정보 가져오기
		ArrayList<Commute> clist = commuteService.selectWorkList(commute);

		mv.addObject("clist", clist);
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.setViewName("/commute/commuteList");

		return mv;

	}

	@GetMapping("/changeStatus")
	public String changeWorkStatus(Model model, HttpSession session, HttpServletRequest request) {

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
			commuteService.insertWork(empNo);

		}
		// 퇴근 일때
		else if (status.equals("N")) {
			commuteService.updateWork(commuteNo);
		}

		// 모든 상태 추가
		commuteService.insertWorkStatus(status);

		if (request.getParameter("index").equals("1")) {
			Commute c = commuteService.selectWork(empNo);

			model.addAttribute("c", c);
			return "index";
		} else {
			return "redirect:/commuteCheck";
		}

	}
}
