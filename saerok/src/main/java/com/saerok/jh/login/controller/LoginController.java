package com.saerok.jh.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jh.login.model.service.LoginService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	@Autowired
	private final LoginService service;

	//로그인 화면전환 
	@GetMapping("/loginPage")
    public String selectEmployeeByEmpNo() {
//        Employee e = service.selectEmployeeByEmpNo(empNo);
		//todo 수정
        return "login/loginPage";
    }

	//마이페이지 화면전환
	@RequestMapping("/mypage")
	public String myPage() {
	    return "login/mypage";
	}
	
	//마이페이지 수정
	@PostMapping("/updatemypage")
	public String updateMyPage(Employee e, Model model) {
		int result = service.updateMyPage(e);
		String msg, loc;
		if (result > 0) {
			msg = "수정성공";
			loc = "/mypage";
		} else {
			msg = "수정실패";
			loc = "login//mypage?empNo=" + e.getEmpNo();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";
	}

	
	
	
	
	

	//메인페이지
	@GetMapping("/index")
	public String m() {
	    return "index";
	}
	


}
