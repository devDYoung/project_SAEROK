package com.saerok.jy.schedule.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;
import com.saerok.jy.schedule.service.ScheduleService;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@RequestMapping("calendar")
@Controller
public class ScheduleController {
	
	private final ScheduleService skdService;
	
	@Autowired
	public ScheduleController(ScheduleService skdService) {
		this.skdService=skdService;
	}
	
	// 내문서함 조회
		@GetMapping("/calendarwrite")
		public void calendarWrite() {
		}
		
		// 내문서함 조회
		@GetMapping("/calendarstarview")
		public void calendarImpt() {
		}
		// 내문서함 조회
		@GetMapping("/calendarview")
		public void calendarView() {
		}
		// 내문서함 조회
		@GetMapping("/calendarmain")
		public void calendarMain() {
		}
		
	

		
	//일정 메인 (캘린더에서 데이터 조회)
		@GetMapping("main")
		public String Main(ModelAndView mv, HttpServletRequest request, Model model, Principal loginSession) {
			model.addAttribute("page", "calendar/calendarmain");
		
			String empNo = loginSession.getName();

			List<Schedule> schedule= skdService.getSchedule(empNo);
			request.setAttribute("schduleList", schedule);
			System.out.println(schedule);
			
			return "index";
		}
		
		
		//일정 작성 (화면)
		@GetMapping("write")
		public String write(Model model) {
			model.addAttribute("title", "CALENDAR");
			model.addAttribute("page", "calendar/calendarmain");
			return "index";
		}
		
		//일정 작성
		@PostMapping("write")
		public String write(Schedule sc, Model model, HttpSession session,Principal loginSession) {
			
			String empNo = loginSession.getName();
			
			sc.setEmpNo(empNo);
			int result = skdService.write(sc);
			
			
			//화면 선택
			if(result ==1) {
				session.setAttribute("alertMsg", "일정 등록 완료");
				return "redirect:/calendar/calendarview/1";
			}else {
				session.setAttribute("alertMsg" , "일정 등록 실패");
				return "redirect:/calendar/calendarview/1";
			}
			
		}
		
		
		//일정 수정 (화면)
		@GetMapping("edit/{no}")
		public String edit(Model model, @PathVariable String no) {
			Schedule schedule = skdService.selectOne(no);
			model.addAttribute("page", "calendar/calendaredit");
			model.addAttribute("schedule", schedule);
			return "index";
		}
		
		//일정 수정
		@PostMapping("edit/{no}")
		public String edit(@PathVariable String no, Model model, Schedule sc, HttpSession session) {
			
			sc.setScheduleNo(no);
			
			int result = skdService.edit(sc);
			
			if(result == 1) {
				session.setAttribute("alertMsg", "일정 수정 완료");
				return "redirect:/calendar/view/1";
			}else {
				session.setAttribute("alertMsg", "일정 수정 실패");
				return "redirect:/calendar/view/1";
			}
			
		}
		
		
		
		//일정 삭제
		@GetMapping("delete/{no}")
		public String delete(@PathVariable String no , HttpSession session , Model model) {
			
			int result = skdService.delete(no);
			
			if(result ==1) {
				session.setAttribute("alertMsg", "일정이 삭제되었습니다.");
				return "redirect:/calendar/view/1";
			}else {
				session.setAttribute("alertMsg", "일정 삭제 실패");
				return "redirect:/calendar/view/1";
			}
		}
		
		
		
		//일정 조회
		@GetMapping("view")
		public String view(Model model, HttpServletRequest req,Principal loginSession) {
			model.addAttribute("page", "calendar/calendarview");
			
			int totalCount = skdService.selectTotalCnt(); 
			String empNo = loginSession.getName();
			
			//데이터 조회
			List<Schedule> scheduleList = skdService.selectList(empNo);
			model.addAttribute("scheduleList", scheduleList);
			
			return "index"; 
		}
		
		
		//일정 상세 조회
		@GetMapping("detail/{no}")
		public String detail(@PathVariable String no, Model model) {
			model.addAttribute("page", "calendar/calendardetail");
			
			Schedule schdeule = skdService.selectOne(no);
			
			model.addAttribute("schdeule", schdeule);
			
			return "index";
		}
		
		
		//중요 일정 등록하기, 해제하기
		@GetMapping("star")
		@ResponseBody
		public String star(String scheduleNo, HttpSession session,Principal loginSession) {
			
			String empNo = loginSession.getName();
			Schedule skd = new Schedule();
			
			skd.setScheduleNo(scheduleNo);
			
			return skdService.star(skd);
		}
		
		
		//중요 일정만 조회하기
		@GetMapping("starview")
		public String starview (Model model, HttpServletRequest req, HttpSession session,Principal loginSession) {
			model.addAttribute("page", "calendar/calendarstarview");
			
			int totalCount = skdService.selectTotalCnt();
			
			String empNo = loginSession.getName();
			
			//데이터 조회
			List<Schedule> scheduleList = skdService.selectStarList(empNo);
			
			 
			model.addAttribute("scheduleList", scheduleList);
			
			return "index"; 
		}
}
