package com.saerok.jh.login.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.saerok.ch.sales.model.service.SalesService;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jh.login.model.service.LoginService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {

	@Autowired
	private final LoginService service;
    private final SalesService salesService;


	// 로그인 화면전환
	@GetMapping("/loginPage")
	public String selectEmployeeByEmpNo() {
//        Employee e = service.selectEmployeeByEmpNo(empNo);
		// todo 수정333
		return "login/loginPage";
	}

	// 마이페이지 화면전환
//	@RequestMapping("/mypage")
//	public String myPage(Model model,  String empNo) {
//		//todo 로그인한 사원의 정보를 select
//		
//		Employee mypageEmp = service.selectEmployeeByEmpNo(empNo);
//		
//		model.addAttribute("employee", mypageEmp);
//		//login/mypage 페이지에 전달
//		return "login/mypage";
//	}

	// 마이페이지 수정
	@PostMapping("/updatemypage")
	public void updateMyPage(Employee e, Model model) {
		// 비밀번호 암호화

		// 비밀번호 암호화 처리
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		e.setEmpPw(encoder.encode(e.getEmpPw()));

		int result = service.updateMyPage(e);
		String msg, loc, successYn;
		if (result > 0) {
			successYn = "Y";
			msg = "수정성공";
			loc = "/mypage";
		} else {
			successYn = "N";
			msg = "수정실패";
			loc = "login//mypage?empNo=" + e.getEmpNo();
		}
		model.addAttribute("successYn", "Y");
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
	}

	// 메인페이지
	@GetMapping("/index")
	public String mainpage(Model model) {
		List<Map<String, Object>> monthlySalesTotals = salesService.findMonthlySalesTotals();
		model.addAttribute("monthlySalesTotals", monthlySalesTotals);
		return "index";
	}

}
