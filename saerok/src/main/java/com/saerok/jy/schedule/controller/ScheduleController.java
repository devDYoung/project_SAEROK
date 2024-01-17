//package com.saerok.jy.schedule.controller;
//
//import java.security.Principal;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.saerok.PageFactory;
//import com.saerok.jy.schedule.dto.Schedule;
//import com.saerok.jy.schedule.service.ScheduleService;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
//
//@Controller
//@RequestMapping("/calendar")
//public class ScheduleController {
//	
//	@Autowired
//	private ScheduleService skdService;
//	
//	
//	//일정 메인 (캘린더에서 데이터 조회)
//		@GetMapping("Main")
//		public String skdMain(ModelAndView mv, HttpServletRequest request, Model model, Principal loginSession) {
//			model.addAttribute("page", "calendar/calendarMain");
//			
//			String empNo = loginSession.getName();
//
//			List<Schedule> skd= skdService.getSkd(empNo);
//			request.setAttribute("calendarList", skd);
//			
//			
//			return "index";
//		}
//		
//
//		//일정 메인에서 모달로 상세정보 조회
//		
//		//일정 캘린더에서 모달로 일정 작성
//
//		//메인에서 모달로 일정 수정
//		
//		//메인에서 모달로 일정 삭제
//
//		
//		
//		//일정 작성 (화면)
//		@GetMapping("Write")
//		public String skdWrite(Model model) {
//			model.addAttribute("title", "CALENDAR");
//			model.addAttribute("page", "calendar/calendarWrite");
//			return "index";
//		}
//		
//		//일정 작성
//		@PostMapping("Write")
//		public String skdWrite(Schedule skd, Model model, HttpSession session,Principal loginSession) {
//			
//			String empNo = loginSession.getName();
//		
//			
//			skd.setEmpNo(empNo);
//			int result = skdService.skdWrite(skd);
//			
//			
//			//화면 선택
//			if(result >0) {
//				session.setAttribute("alertMsg", "일정 등록 완료");
//				return "redirect:/calendar/view";
//			}else {
//				session.setAttribute("alertMsg" , "일정 등록 실패");
//				return "redirect:/calendar/view";
//			}
//			
//		}
//		
//		
//		//일정 수정 (화면)
//		@GetMapping("Edit/{no}")
//		public String skdEdit(Model model, @PathVariable String empNo) {
//			Schedule skd = skdService.selectOne(empNo);
//			model.addAttribute("page", "calendar/calendarEdit");
//			model.addAttribute("skd", skd);
//			return "layout/template";
//		}
//		
//		//일정 수정
//		@PostMapping("Edit/{no}")
//		public String skdEdit(@PathVariable int empNo, Model model, Schedule skd, HttpSession session) {
//			
//			skd.setScheduleNo(empNo);
//			
//			int result = skdService.skdEdit(skd);
//			
//			if(result >0) {
//				session.setAttribute("alertMsg", "일정 수정 완료");
//				return "redirect:/calendar/View";
//			}else {
//				session.setAttribute("alertMsg", "일정 수정 실패");
//				return "redirect:/calendar/View";
//			}
//			
//		}
//		
//		
//		
//		//일정 삭제
//		@GetMapping("Delete/{no}")
//		public String skdDelete(@PathVariable int no , HttpSession session , Model model) {
//			
//			int result = skdService.skdDelete(no);
//			
//			if(result >0) {
//				session.setAttribute("alertMsg", "일정이 삭제되었습니다.");
//				return "redirect:/calendar/View/";
//			}else {
//				session.setAttribute("alertMsg", "일정 삭제 실패");
//				return "redirect:/calendar/View";
//			}
//		}
//		
//		
//		
//		//일정 조회
//		@GetMapping("View/{pno}")
//		public String skdView(Model model, @PathVariable int cPage, HttpServletRequest req, HttpSession session,Principal loginSession) {
//			model.addAttribute("page", "calendar/calendarView");
//			
//			int numPerpage = skdService.selectToatalCnt();
//			
//			PageFactory pf = PageFactory.getPage(cPage, numPerpage, 5);
//			
//			String empNo = loginSession.getName();
//			
//			//데이터 조회
//			List<Schedule> skdList = skdService.selectList(pf, empNo);
//			
//			
//			model.addAttribute("skdList", skdList);
//			model.addAttribute("pf", pf);
//			
//			return "index"; 
//		}
//		
//		
//		//일정 상세 조회
//		@GetMapping("Detail/{no}")
//		public String skdDetail(@PathVariable String no, Model model) {
//			model.addAttribute("page", "calendar/calendarDetail");
//			
//			Schedule skd = skdService.selectOne(no);
//			
//			model.addAttribute("skd", skd);
//			
//			return "index";
//		}
//		
//		
//		//중요 일정 등록하기, 해제하기
//		@GetMapping("Impt")
//		@ResponseBody
//		public String skdImpt(int scheduleNo, HttpSession session,Principal loginSession) {
//			
//			String empNo = loginSession.getName();
//			Schedule skd = new Schedule();
//			
//			skd.setScheduleNo(scheduleNo);
//			
//			return skdService.skdImpt(skd);
//		}
//		
//		
//		//중요 일정만 조회하기
//		@GetMapping("ImptView/{pno}")
//		public String imptView (Model model, @PathVariable int pno, HttpServletRequest req, HttpSession session,Principal loginSession) {
//			model.addAttribute("page", "calendar/calendarImptView");
//			
//			int totalCount = skdService.selectToatalCnt();
//			
//			PageFactory pf = PageFactory.getPageFactory(totalCount, pno, 5, 10);
//			
//			String empNo = loginSession.getName();
//			
//			//데이터 조회
//			List<Schedule> skdList = skdService.selectImptList(pf, empNo);
//			
//			 
//			model.addAttribute("skdList", skdList);
//			model.addAttribute("pf", pf);
//			
//			return "index"; 
//		}
//	
//	
//
//}
