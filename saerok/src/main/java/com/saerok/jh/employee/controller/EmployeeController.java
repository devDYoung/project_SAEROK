package com.saerok.jh.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmployeeController {
//	@Autowired
//	private final EmployeeService service;
	
	//사원등록 화면전환 
	@GetMapping("/insertemp")
	public String insertEmployee() {
		return "employee/insertemployee";
		
	}
	
}
