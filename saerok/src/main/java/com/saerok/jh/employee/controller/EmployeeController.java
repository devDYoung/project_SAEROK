package com.saerok.jh.employee.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.saerok.jh.employee.model.service.EmployeeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmployeeController {
	@Autowired
	private final EmployeeService service;
	
	//사원등록 화면전환 
	@GetMapping("/insertemp")
	public String insertEmployee() {
		return "employee/insertemployee";
		
	}
	
	//사원등록
	@PostMapping("/insertempEnd")
	public String insertEmployeeEnd(@RequestParam Map<String,Object> param, Model model) {
		int result = 0;	
		System.out.println(param);
		
		result=service.insertEmployeeEnd(param);
		
		String msg, loc;
	      if(result>0) {
	         msg="사원등록성공";
	         loc="employee/successemp"; 
	      }else {
	         msg="사원등록실패";
	         loc="/index";
	      }
	      
	      model.addAttribute("msg",msg);
	      model.addAttribute("loc",loc);
	      
	      
	      return "common/msg";

		
	}
	
	
	
	
	
	
	
	
}
