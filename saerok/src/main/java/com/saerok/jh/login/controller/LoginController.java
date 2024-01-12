package com.saerok.jh.login.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.ch.sales.model.service.SalesService;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jh.login.model.service.LoginService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
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

	//마이페이지 수정
	   @PostMapping("/updatemypage")
	   @ResponseBody
	   public Map<String,String> updateMyPage(@RequestParam(required = false) MultipartFile profile,
			   Employee e, Model model) {
	      // 비밀번호 암호화 처리
//	      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	      e.setEmpPw(encoder.encode(e.getEmpPw(1234)));
		   
		  log.debug("{}",profile.getSize());
		  log.debug("{}",profile.getName());
		  log.debug("{}",profile.getOriginalFilename());
		  log.debug("{}",e);
	      int result = service.updateMyPage(e);
	      
	      return Map.of("successYn",result==1?"Y":"N");
	   }


	// 메인페이지
	@GetMapping("/index")
	public String mainpage(Model model) {
		List<Map<String, Object>> monthlySalesTotals = salesService.findMonthlySalesTotals();
		model.addAttribute("monthlySalesTotals", monthlySalesTotals);
		return "index";
	}

}