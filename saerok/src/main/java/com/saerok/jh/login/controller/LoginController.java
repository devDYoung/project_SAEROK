package com.saerok.jh.login.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.ch.sales.model.service.SalesService;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jh.login.model.service.LoginService;

import jakarta.servlet.http.HttpSession;
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
			   Employee e,HttpSession session) {
	      // 비밀번호 암호화 처리
		   int result=0;
		   try {
               if (!profile.isEmpty()) {
                   // 원본 파일명
                  
                   String originalFileName = profile.getOriginalFilename();

                   // 서버에 저장할 파일명 생성 (현재 시간을 사용)
                   String destFileName = System.currentTimeMillis() + "_" + originalFileName;

                   // 파일을 서버에 저장하는 로직
                   String path = session.getServletContext().getRealPath("/resources/upload/profile/"); 
                   File destFile = new File(path,destFileName);
                   profile.transferTo(destFile);

                   e.setOriFileName(originalFileName); 
                   e.setDestFileName(destFileName); 
                   
                   result = service.updateMyPage(e);
	           		
                   return Map.of("successYn",result==1?"Y":"N");
               }

           } catch (IOException exception) {
        	   exception.printStackTrace();
           }
		   return Map.of("successYn",result==1?"Y":"N");
	      
	      
	   }


	// 메인페이지
	@RequestMapping("/")
	public String mainpage(Model model) {
		List<Map<String, Object>> monthlySalesTotals = salesService.findMonthlySalesTotals();
		model.addAttribute("monthlySalesTotals", monthlySalesTotals);
		return "index";
	}
	
	// 내 근태 조회
	@GetMapping("/commute/commuteMain.do")
	public void commuteMain() {}
	
	// 일정 조회
	@GetMapping("/calendar/calendarMain.do")
	public void calendarMain() {}
	
	// 일정 조회
	@GetMapping("/calendar/calendarView.do")
	public void calendarView() {}

	// 일정 조회
	@GetMapping("/calendar/calendarWrite.do")
	public void calendarWrite() {}

}