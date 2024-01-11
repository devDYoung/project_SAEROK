package com.saerok.jy.commute.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saerok.jy.commute.dto.Commute;
import com.saerok.jy.commute.service.CommuteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
//@RequiredArgsConstructor
//@RequestMapping("/commute")
public class CommuteController {

	@Autowired
	private CommuteService commuteService;

	// 근무정보 조회하기
	@GetMapping("/commute.do")
	public ModelAndView selectCommuteList(HttpSession session, ModelAndView mv, Principal loginSession) {

		// 현재 로그인 중인 사원의 사원번호
		String empNo = loginSession.getName();
		// 사원의 오늘 근무정보 가져오기
	Commute c = commuteService.selectCommute(empNo);

		mv.addObject("c", c);
		mv.setViewName("commute/commuteMain"); // 보여줄 화면 : commuteMain.jsp

		return mv;
	}

	@GetMapping("/selectCommuteList.do")
	public ModelAndView selectCommuteList2(HttpSession session, ModelAndView mv, @RequestParam("year") int year,
			@RequestParam("month") int month, @RequestParam("empNo") String empNo) {

		Commute commute = new Commute();
		commute.setEmpNo(empNo);

		// 사원의 이번달 근무정보 가져오기
		ArrayList<Commute> clist = commuteService.selectCommuteList(commute);

		mv.addObject("clist", clist);
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.setViewName("commute/commuteList");

		return mv;

	}

//	// 출퇴근버튼 눌렀을 때
//	@GetMapping("/changeStatus.do")
//	public String changeCommuteStatus(Model model, HttpSession session, HttpServletRequest request,
//			Principal loginSession) {
//		// 사원번호
//		String empNo = loginSession.getName();
//
//		// 상태
//		String status = request.getParameter("status");
//		LocalDateTime checkDate = LocalDateTime.now();
//		Map param = new HashMap();
//		param.put("status", status);
//		param.put("empNo", empNo);
//		if (checkDate.getHour() > 9) {
//			param.put("lateYN", "Y");
//		} else {
//			param.put("lateYN", "N");
//		}
//
//		commuteService.insertCommuteStatus(param);
//
//		return "index";
//	}

	// 출퇴근버튼 눌렀을 때
	@PostMapping("/workIn.do")
    @ResponseBody
	public Map<String, String> workIn(Model model, HttpSession session, HttpServletRequest request, Principal loginSession) {
		// 사원번호
		String empNo = loginSession.getName();

		// 상태
		String status = request.getParameter("status");
		LocalDateTime checkDate = LocalDateTime.now();
		Map param = new HashMap();
		param.put("status", status);
		param.put("empNo", empNo);
		String lateYN = "N";
		if (checkDate.getHour() > 9) {
			lateYN = "Y";
		} 
		param.put(lateYN, lateYN);

		int result = commuteService.insertCommuteStatus(param);
		Map<String, String> returnResult =  new HashMap<>();
		returnResult.put("lateYN", lateYN);
		if(result > 0) {
			returnResult.put("successYn", "Y");
			returnResult.put("checkDate", checkDate.toString());
		}else {
			returnResult.put("successYn", "N");
			returnResult.put("checkDate", "미등록");
		}
		
		return returnResult;
		
	}
	// 근무상태조회
	// commuteNo를 전달하면 해당하는 근무 상태 리스트로 반환
//	@GetMapping(value = "selectCommuteStatus.do", produces = "application/json; charset=utf-8")
//	public String selectCommuteStatusList(@RequestParam("commuteNo") int commuteNo) {
//		
//	}
//

}
