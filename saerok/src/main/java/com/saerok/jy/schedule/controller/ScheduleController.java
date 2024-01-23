package com.saerok.jy.schedule.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saerok.PageFactory;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jy.schedule.dto.Schedule;
import com.saerok.jy.schedule.service.ScheduleService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/calendar")
public class ScheduleController {
	
	// 내문서함 조회
		@GetMapping("/calendarWrite")
		public void calendarWrite() {
		}
		
		// 내문서함 조회
		@GetMapping("/calendarImpt")
		public void calendarImpt() {
		}
		// 내문서함 조회
		@GetMapping("/calendarView")
		public void calendarView() {
		}
		// 내문서함 조회
		@GetMapping("/calendarMain")
		public void calendarMain() {
		}
		
	
	@Autowired
	private ScheduleService skdService;
		
	//일정 메인 (캘린더에서 데이터 조회)
		@GetMapping("Main")
		public String skdMain(ModelAndView mv, HttpServletRequest request, Model model, Principal loginSession) {
			model.addAttribute("page", "calendar/calendarMain");
		
			String empNo = loginSession.getName();

			List<Schedule> schedule= skdService.getSchedule(empNo);
			request.setAttribute("schduleList", schedule);
			System.out.println(schedule);
			
			return "index";
		}
		
		
		//일정 작성 (화면)
		@GetMapping("Write")
		public String skdWrite(Model model) {
			model.addAttribute("title", "CALENDAR");
			model.addAttribute("page", "calendar/calendarWrite");
			return "index";
		}
		
		//일정 작성
		@PostMapping("Write")
		public String skdWrite(Schedule sc, Model model, HttpSession session,Principal loginSession) {
			
			String empNo = loginSession.getName();
			
			sc.setEmpNo(empNo);
			int result = skdService.skdWrite(sc);
			
			
			//화면 선택
			if(result ==1) {
				session.setAttribute("alertMsg", "일정 등록 완료");
				return "redirect:/calendarView/1";
			}else {
				session.setAttribute("alertMsg" , "일정 등록 실패");
				return "redirect:/calendar/View/1";
			}
			
		}
		
		
		//일정 수정 (화면)
		@GetMapping("Edit/{no}")
		public String skdEdit(Model model, @PathVariable String no) {
			Schedule schedule = skdService.selectOne(no);
			model.addAttribute("page", "calendar/calendarEdit");
			model.addAttribute("schedule", schedule);
			return "index";
		}
		
		//일정 수정
		@PostMapping("Edit/{no}")
		public String skdEdit(@PathVariable String no, Model model, Schedule sc, HttpSession session) {
			
			sc.setScheduleNo(no);
			
			int result = skdService.skdEdit(sc);
			
			if(result == 1) {
				session.setAttribute("alertMsg", "일정 수정 완료");
				return "redirect:/calendar/View/1";
			}else {
				session.setAttribute("alertMsg", "일정 수정 실패");
				return "redirect:/calendar/View/1";
			}
			
		}
		
		
		
		//일정 삭제
		@GetMapping("Delete/{no}")
		public String skdDelete(@PathVariable String no , HttpSession session , Model model) {
			
			int result = skdService.skdDelete(no);
			
			if(result ==1) {
				session.setAttribute("alertMsg", "일정이 삭제되었습니다.");
				return "redirect:/calendar/View/1";
			}else {
				session.setAttribute("alertMsg", "일정 삭제 실패");
				return "redirect:/calendar/View/1";
			}
		}
		
		
		
		//일정 조회
		@GetMapping("View/{pno}")
		public String skdView(Model model, @PathVariable int cPage, HttpServletRequest req, HttpSession session,Principal loginSession) {
			model.addAttribute("page", "calendar/calendarView");
			
			int numPerpage = skdService.selectTotalCnt();
			
			//PageFactory pf = PageFactory.getPage(cPage, numPerpage, 5);
			PageFactory pf = new PageFactory();
			int totalCount = skdService.selectTotalCnt(); // 이 부분을 추가
			model.addAttribute("pageBar", pf.getPage(cPage, numPerpage, totalCount, "View"));
			
			String empNo = loginSession.getName();
			
			//데이터 조회
			List<Schedule> scheduleList = skdService.selectList(pf, empNo);
			
			
			model.addAttribute("scheduleList", scheduleList);
			model.addAttribute("pf", pf);
			
			return "index"; 
		}
		
		
		//일정 상세 조회
		@GetMapping("Detail/{no}")
		public String skdDetail(@PathVariable String no, Model model) {
			model.addAttribute("page", "calendar/calendarDetail");
			
			Schedule schdeule = skdService.selectOne(no);
			
			model.addAttribute("schdeule", schdeule);
			
			return "index";
		}
		
		
		//중요 일정 등록하기, 해제하기
		@GetMapping("Impt")
		@ResponseBody
		public String skdImpt(String scheduleNo, HttpSession session,Principal loginSession) {
			
			String empNo = loginSession.getName();
			Schedule skd = new Schedule();
			
			skd.setScheduleNo(scheduleNo);
			
			return skdService.skdImpt(skd);
		}
		
		
		//중요 일정만 조회하기
//		@GetMapping("ImptView/{pno}")
//		public String imptView (Model model, @PathVariable int pno, HttpServletRequest req, HttpSession session,Principal loginSession) {
//			model.addAttribute("page", "calendar/calendarImptView");
//			
//			int totalCount = skdService.selectTotalCnt();
//			
//			PageFactory pf = new PageFactory();
//			model.addAttribute("pageBar", pf.getPage(pno, 5, totalCount, "ImptView"));
//			
//			String empNo = loginSession.getName();
//			
//			//데이터 조회
//			List<Schedule> scheduleList = skdService.selectImptList(pf, empNo);
//			
//			 
//			model.addAttribute("scheduleList", scheduleList);
//			model.addAttribute("pf", pf);
//			
//			return "index"; 
//		}
//	
	

}
