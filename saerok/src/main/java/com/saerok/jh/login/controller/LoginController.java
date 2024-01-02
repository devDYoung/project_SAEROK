package com.saerok.jh.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.saerok.jh.login.model.service.LoginService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	@Autowired
	private final LoginService service;

	//로그인 
	@GetMapping("/loginPage")
    public String selectEmployeeByEmpNo() {
//        Employee e = service.selectEmployeeByEmpNo(empNo);
        return "login/loginPage";
    }
	
	@PostMapping("/")
	public String index() {
		return "index";
	}
	


}
