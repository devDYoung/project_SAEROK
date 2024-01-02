package com.saerok.jh.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
        return "login/loginPage";
    }

	//마이페이지
	@RequestMapping("/mypage")
	public String myPage() {
	    return "login/mypage";
	}

	//메인페이지
	@GetMapping("/index")
	public String m() {
	    return "index";
	}
	


}
