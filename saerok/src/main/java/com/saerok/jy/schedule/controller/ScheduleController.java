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
		@GetMapping("/calendarWrite")
		public void calendarWrite() {
		}
		
		// 내문서함 조회
		@GetMapping("/calendarStarView")
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
		
	

		
	//일정 메인 (캘린더에서 데이터 조회)
		@GetMapping("Main")
		public String Main(ModelAndView mv, HttpServletRequest request, Model model, Principal loginSession) {
			model.addAttribute("page", "calendar/calendarMain");
		
			String empNo = loginSession.getName();

			List<Schedule> schedule= skdService.getSchedule(empNo);
			request.setAttribute("schduleList", schedule);
			System.out.println(schedule);
			
			return "index";
		}
		
		
		//일정 작성 (화면)
		@GetMapping("Write")
		public String write(Model model) {
			model.addAttribute("title", "CALENDAR");
			model.addAttribute("page", "calendar/calendarWrite");
			return "index";
		}
		
		//일정 작성
		@PostMapping("Write")
		public String write(Schedule sc, Model model, HttpSession session,Principal loginSession) {
			
			String empNo = loginSession.getName();
			
			sc.setEmpNo(empNo);
			int result = skdService.write(sc);
			
			
			//화면 선택
			if(result ==1) {
				session.setAttribute("alertMsg", "일정 등록 완료");
				return "redirect:/calendar/calendarView";
			}else {
				session.setAttribute("alertMsg" , "일정 등록 실패");
				return "redirect:/calendar/calendarView";
			}
			
		}
		
		
		//일정 수정 (화면)
		@GetMapping("Edit/{no}")
		public String edit(Model model, @PathVariable String no) {
			Schedule schedule = skdService.selectOne(no);
			model.addAttribute("page", "calendar/calendarEdit");
			model.addAttribute("schedule", schedule);
			return "index";
		}
		
		//일정 수정
		@PostMapping("Edit/{no}")
		public String edit(@PathVariable String no, Model model, Schedule sc, HttpSession session) {
			
			sc.setScheduleNo(no);
			
			int result = skdService.edit(sc);
			
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
		public String delete(@PathVariable String no , HttpSession session , Model model) {
			
			int result = skdService.delete(no);
			
			if(result ==1) {
				session.setAttribute("alertMsg", "일정이 삭제되었습니다.");
				return "redirect:/calendar/View/1";
			}else {
				session.setAttribute("alertMsg", "일정 삭제 실패");
				return "redirect:/calendar/View/1";
			}
		}
		
		
		
		//일정 조회
		@GetMapping("View")
		public String view(Model model, HttpServletRequest req,Principal loginSession) {
			model.addAttribute("page", "calendar/calendarView");
			
//			int numPerpage = skdService.selectTotalCnt();
			
			//PageFactory pf = PageFactory.getPage(cPage, numPerpage, 5);
//			PageFactory pf = new PageFactory();
			int totalCount = skdService.selectTotalCnt(); // 이 부분을 추가
//			model.addAttribute("pageBar", pf.getPage(cPage, numPerpage, totalCount, "View"));
			
			String empNo = loginSession.getName();
			
			//데이터 조회
			List<Schedule> scheduleList = skdService.selectList(empNo);
			
			
			model.addAttribute("scheduleList", scheduleList);
//			model.addAttribute("pf", pf);
			
			return "index"; 
		}
		
		
		//일정 상세 조회
		@GetMapping("Detail/{no}")
		public String detail(@PathVariable String no, Model model) {
			model.addAttribute("page", "calendar/calendarDetail");
			
			Schedule schdeule = skdService.selectOne(no);
			
			model.addAttribute("schdeule", schdeule);
			
			return "index";
		}
		
		
		//중요 일정 등록하기, 해제하기
		@GetMapping("Star")
		@ResponseBody
		public String star(String scheduleNo, HttpSession session,Principal loginSession) {
			
			String empNo = loginSession.getName();
			Schedule skd = new Schedule();
			
			skd.setScheduleNo(scheduleNo);
			
			return skdService.star(skd);
		}
		
		
		//중요 일정만 조회하기
		@GetMapping("StarView/{pno}")
		public String starview (Model model, @PathVariable int pno, HttpServletRequest req, HttpSession session,Principal loginSession) {
			model.addAttribute("page", "calendar/calendarStarView");
			
			int totalCount = skdService.selectTotalCnt();
			
//			PageFactory pf = new PageFactory();
//			model.addAttribute("pageBar", pf.getPage(pno, 5, totalCount, "ImptView"));
			
			String empNo = loginSession.getName();
			
			//데이터 조회
			List<Schedule> scheduleList = skdService.selectStarList(empNo);
			
			 
			model.addAttribute("scheduleList", scheduleList);
//			model.addAttribute("pf", pf);
			
			return "index"; 
		}
	

//	
//	@GetMapping("/schedule")
//	@ResponseBody
//	// 일정 메인 조회(홈)
//	public String scheduleList(Model model,Principal loginSession) {
//		//String empNo = (String)session.getAttribute("empNo");
//		//log.debug("\u001B[41m" + "로그인아이디 : " + userId + "\u001B[0m");
//		String empNo = loginSession.getName();
//		// 오늘의 일정 리스트 모델에 셋팅
//		List<Schedule> scheduleList = skdService.selectTodaySchedule(empNo);
//		
//		model.addAttribute("scheduleList", scheduleList);
//		model.addAttribute("empNo", empNo);
//		
//		return "/schedule";
//	}
//	
//
//	// 일정 전체조회
//    @GetMapping("/events/everySchedule")
//    @ResponseBody
//    public ResponseEntity<List<Map<String, Object>>> getEvents(HttpSession session, @RequestParam(required = false) String skdTypeCd,Principal loginSession) {
////    	String empNo = (String)session.getAttribute("empNo");
//    	String empNo = loginSession.getName();
//    	//log.debug("\u001B[41m" + "RestAPI getEvents skdTypeCd : " + skdTypeCd + "\u001B[0m");
//    	
//    	// 카테고리별로 일정 조회 구분
//    	List <Schedule> schedules = null;
//    	if(skdTypeCd == null) {
//    		schedules = skdService.selectMonthSchedule(empNo);
//    		//log.debug("\u001B[41m" + "RestAPI getEvents all : " + schedules + "\u001B[0m");
//    	} else if (empNo == "admin") {
//    		schedules = skdService.selectAdminSchedule();
//    		//log.debug("\u001B[41m" + "RestAPI getEvents admin : " + schedules + "\u001B[0m");
//    	}
//    	
//    	List<Map<String, Object>> monthScheduleList = new ArrayList<>();
//    	for(Schedule schedule : schedules) {
//    		Map<String, Object> eventData = new HashMap<>();
//    		// 일정시작시간
//    		LocalDate startDate = LocalDate.parse(schedule.getSkdStartYmd());
//    		LocalTime startTime = LocalTime.parse(schedule.getSkdStart());
//    		LocalDateTime startDateTime = LocalDateTime.of(startDate, startTime);
//    		// 일정종료시간
//    		LocalDate endDate = LocalDate.parse(schedule.getSkdEndYmd());
//    		LocalTime endTime = LocalTime.parse(schedule.getSkdEnd());
//    		LocalDateTime endDateTime = LocalDateTime.of(endDate, endTime);
//    		
//    		String typeCd = null;
//    		String title = null;
//    		if(schedule.getSkdTypeCd().equals("00")) {
//    			typeCd = "회사";
//    			title = "[" + typeCd + "] " + schedule.getSkdTitle();
//    		} else if(schedule.getSkdTypeCd().equals("99")){
//    			typeCd = "개인";
//    			title = "[" + typeCd + "] " + schedule.getSkdTitle();
//    		} else {
//    			typeCd = "부서";
//    			title = "[" + typeCd + "] " + schedule.getSkdTitle();
//    		}
//            // FullCalendar 표시데이터
//            eventData.put("id", schedule.getScheduleNo());
//            eventData.put("title", title);
//            eventData.put("start", startDateTime.toString());
//            eventData.put("end", endDateTime.toString());
//            monthScheduleList.add(eventData);
//    	}
//    	
//    	//log.debug("\u001B[41m" + "RestAPI getEvents monthScheduleList : " + monthScheduleList + "\u001B[0m");
//    	
//    	return new ResponseEntity<>(monthScheduleList, HttpStatus.OK);
//    }
//	
//    // 회사 일정 조회
//    @GetMapping("/events/adminSchedule")
//    @ResponseBody
//    public ResponseEntity<List<Map<String, Object>>> getAdminEvents(HttpSession session, @RequestParam(required = false) String skdTypeCd) {
//    	String empNo = (String)session.getAttribute("empNo");
//    	//log.debug("\u001B[41m" + "RestAPI getAdminEvents skdTypeCd : " + skdTypeCd + "\u001B[0m");
//    	
//    	// 카테고리별로 일정 조회 구분
//    	List <Schedule> schedules = null;
//    	if (empNo == "admin") {
//    		schedules = skdService.selectAdminSchedule();
//    		//log.debug("\u001B[41m" + "RestAPI getAdminEvents admin : " + schedules + "\u001B[0m");
//    	} else {
//    		schedules = skdService.selectFilteredMonthSchedule(empNo,skdTypeCd);
//    		//log.debug("\u001B[41m" + "RestAPI getAdminEvents other : " + schedules + "\u001B[0m");
//    	}
//    	
//    	List<Map<String, Object>> monthScheduleList = new ArrayList<>();
//    	for(Schedule schedule : schedules) {
//    		Map<String, Object> eventData = new HashMap<>();
//    		// 일정시작시간
//    		LocalDate startDate = LocalDate.parse(schedule.getSkdStartYmd());
//    		LocalTime startTime = LocalTime.parse(schedule.getSkdStart());
//    		LocalDateTime startDateTime = LocalDateTime.of(startDate, startTime);
//    		// 일정종료시간
//    		LocalDate endDate = LocalDate.parse(schedule.getSkdEndYmd());
//    		LocalTime endTime = LocalTime.parse(schedule.getSkdEnd());
//    		LocalDateTime endDateTime = LocalDateTime.of(endDate, endTime);
//    		
//    		String typeCd = "회사";
//    		String title = "[" + typeCd + "] " + schedule.getSkdTitle();
//    		
//            // FullCalendar 표시데이터
//            eventData.put("id", schedule.getScheduleNo());
//            eventData.put("title", title);
//            eventData.put("start", startDateTime.toString());
//            eventData.put("end", endDateTime.toString());
//            monthScheduleList.add(eventData);
//    	}
//    	
//    	//log.debug("\u001B[41m" + "RestAPI getAdminEvents monthScheduleList : " + monthScheduleList + "\u001B[0m");
//    	
//    	return new ResponseEntity<>(monthScheduleList, HttpStatus.OK);
//    }
//    // 부서 일정 조회
//    @GetMapping("/events/deptSchedule")
//    @ResponseBody
//    public ResponseEntity<List<Map<String, Object>>> getDeptEvents(HttpSession session, @RequestParam(required = false) String skdTypeCd) {
//    	String empNo = (String)session.getAttribute("empNo");
//    	//log.debug("\u001B[41m" + "RestAPI getDeptEvents skdTypeCd : " + skdTypeCd + "\u001B[0m");
//    	
//    	// 카테고리별로 일정 조회 구분
//    	List <Schedule> schedules = null;
//    	if (empNo == "admin") {
//    		schedules = skdService.selectAdminSchedule();
//    		//log.debug("\u001B[41m" + "RestAPI getDeptEvents admin : " + schedules + "\u001B[0m");
//    	} else {
//    		schedules = skdService.selectFilteredMonthSchedule(empNo,skdTypeCd);
//    		//log.debug("\u001B[41m" + "RestAPI getDeptEvents other : " + schedules + "\u001B[0m");
//    	}
//    	
//    	List<Map<String, Object>> monthScheduleList = new ArrayList<>();
//    	for(Schedule schedule : schedules) {
//    		Map<String, Object> eventData = new HashMap<>();
//    		// 일정시작시간
//    		LocalDate startDate = LocalDate.parse(schedule.getSkdStartYmd());
//    		LocalTime startTime = LocalTime.parse(schedule.getSkdStart());
//    		LocalDateTime startDateTime = LocalDateTime.of(startDate, startTime);
//    		// 일정종료시간
//    		LocalDate endDate = LocalDate.parse(schedule.getSkdEndYmd());
//    		LocalTime endTime = LocalTime.parse(schedule.getSkdEnd());
//    		LocalDateTime endDateTime = LocalDateTime.of(endDate, endTime);
//    		
//    		String typeCd = "부서";
//    		String title = "[" + typeCd + "] " + schedule.getSkdTitle();
//    		
//            // FullCalendar 표시데이터
//            eventData.put("id", schedule.getScheduleNo());
//            eventData.put("title", title);
//            eventData.put("start", startDateTime.toString());
//            eventData.put("end", endDateTime.toString());
//            monthScheduleList.add(eventData);
//    	}
//    	
//    	//log.debug("\u001B[41m" + "RestAPI getDeptEvents monthScheduleList : " + monthScheduleList + "\u001B[0m");
//    	
//    	return new ResponseEntity<>(monthScheduleList, HttpStatus.OK);
//    }
//    // 개인 일정 조회
//    @GetMapping("/events/personalSchedule")
//    @ResponseBody
//    public ResponseEntity<List<Map<String, Object>>> getPersonalEvents(HttpSession session, @RequestParam(required = false) String skdTypeCd) {
//    	String empNo = (String)session.getAttribute("empNo");
//    	//log.debug("\u001B[41m" + "RestAPI getPersonalEvents skdTypeCd : " + skdTypeCd + "\u001B[0m");
//    	
//    	// 카테고리별로 일정 조회 구분
//    	List <Schedule> schedules = null;
//    	if (empNo == "admin") {
//    		schedules = skdService.selectAdminSchedule();
//    		//log.debug("\u001B[41m" + "RestAPI getPersonalEvents admin : " + schedules + "\u001B[0m");
//    	} else {
//    		schedules = skdService.selectFilteredMonthSchedule(empNo,skdTypeCd);
//    		//log.debug("\u001B[41m" + "RestAPI getPersonalEvents other : " + schedules + "\u001B[0m");
//    	}
//    	
//    	List<Map<String, Object>> monthScheduleList = new ArrayList<>();
//    	for(Schedule schedule : schedules) {
//    		Map<String, Object> eventData = new HashMap<>();
//    		// 일정시작시간
//    		LocalDate startDate = LocalDate.parse(schedule.getSkdStartYmd());
//    		LocalTime startTime = LocalTime.parse(schedule.getSkdStart());
//    		LocalDateTime startDateTime = LocalDateTime.of(startDate, startTime);
//    		// 일정종료시간
//    		LocalDate endDate = LocalDate.parse(schedule.getSkdEndYmd());
//    		LocalTime endTime = LocalTime.parse(schedule.getSkdEnd());
//    		LocalDateTime endDateTime = LocalDateTime.of(endDate, endTime);
//    		
//    		String typeCd = "개인";
//    		String title = "[" + typeCd + "] " + schedule.getSkdTitle();
//    		
//            // FullCalendar 표시데이터
//            eventData.put("id", schedule.getScheduleNo());
//            eventData.put("title", title);
//            eventData.put("start", startDateTime.toString());
//            eventData.put("end", endDateTime.toString());
//            monthScheduleList.add(eventData);
//    	}
//    	
//    	//log.debug("\u001B[41m" + "RestAPI getPersonalEvents monthScheduleList : " + monthScheduleList + "\u001B[0m");
//    	
//    	return new ResponseEntity<>(monthScheduleList, HttpStatus.OK);
//    }
//    // 일정 상세
//    @GetMapping("/events/scheduleOne") // scheduleNo에 해당하는 일정 상세 정보 가져오기
//    @ResponseBody
//    public ResponseEntity<Schedule> scheduleOne(@RequestParam int scheduleNo) {
//    	//log.debug("\u001B[41m" + "RestAPI scheduleOne scheduleNo : " + scheduleNo + "\u001B[0m");
//        Schedule scheduleOne = skdService.selectDateSchedule(scheduleNo);
//        
//    	// 일정 시작 시간 및 종료 시간을 12시간 AM/PM 형식으로 변환
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm a", Locale.ENGLISH);
//        LocalDateTime startDateTime = LocalDateTime.parse(scheduleOne.getSkdStartYmd() + " " + scheduleOne.getSkdStart(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//        LocalDateTime endDateTime = LocalDateTime.parse(scheduleOne.getSkdEndYmd() + " " + scheduleOne.getSkdEnd(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//        
//        String formattedStartDateTime = startDateTime.format(formatter);
//        String formattedEndDateTime = endDateTime.format(formatter);
//    
//        String skdTypeCd = scheduleOne.getSkdTypeCd();
//        String typeCdTitle = "";
//        if (skdTypeCd.equals("00")) {
//            typeCdTitle = "회사";
//        } else if (skdTypeCd.equals("99")) {
//            typeCdTitle = "개인";
//        } else {
//            typeCdTitle = "부서";
//        };
//        
//        // 타이틀에 카테고리와 일정 이름 추가
//        String modifiedTitle = "[" + typeCdTitle + "] " + scheduleOne.getSkdTitle();
//        
//        scheduleOne.setSkdStartYmd(formattedStartDateTime);
//        scheduleOne.setSkdEndYmd(formattedEndDateTime);
//        scheduleOne.setSkdTitle(modifiedTitle);
//        
//       // log.debug("\u001B[41m" + "RestAPI scheduleOne scheduleOne : " + scheduleOne + "\u001B[0m");
//        
//        return new ResponseEntity<>(scheduleOne, HttpStatus.OK);
//    }
//    
////    // 일정 추가
////    @PostMapping("/events/insertSchedule")
////    @ResponseBody
////    public ResponseEntity<Map<String, Object>> insertSchedule(Schedule schedule,Principal loginSession) {
////    	// 로그인아이디를 객체에 세팅
////    	//String empNo = (String)session.getAttribute("empNo");
////    	String empNo = loginSession.getName();
////    	schedule.setEmpNo(empNo);
////    	
////    	if(schedule.getSkdTypeCd().equals("employee")) {
////    		String deptCode = skdService.setUserDept(empNo);
////    		schedule.setSkdTypeCd(deptCode);
////    	}
////  
////	    Map<String, Object> response = new HashMap<>();
////
////	    try {
////	        int row = skdService.insertSchedule(schedule);
////	        if (row == 1) {
////	            response.put("success", true);
////	            return new ResponseEntity<>(response, HttpStatus.OK);
////	        } else {
////	            response.put("success", false);
////	            response.put("message", "추가실패");
////	            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
////	        }
////	    } catch (Exception e) {
////	        e.printStackTrace();
////	        response.put("success", false);
////	        response.put("message", "추가오류오류");
////	        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
////	    }
////	}
//    
// // 일정 추가
//    @PostMapping("/events/insertSchedule")
//    @ResponseBody
//    public ResponseEntity<Map<String, Object>> insertSchedule(Schedule schedule, Principal loginSession) {
//        // 로그인아이디를 객체에 세팅
//        //String empNo = (String)session.getAttribute("empNo");
//        String empNo = loginSession.getName();
//        schedule.setEmpNo(empNo);
//
//        // Null 체크 추가
//        if (schedule.getSkdTypeCd() != null && schedule.getSkdTypeCd().equals("employee")) {
//            String deptCode = skdService.setUserDept(empNo);
//            schedule.setSkdTypeCd(deptCode);
//        }
//
//        Map<String, Object> response = new HashMap<>();
//
//        try {
//            int row = skdService.insertSchedule(schedule);
//            if (row == 1) {
//                response.put("success", true);
//                return new ResponseEntity<>(response, HttpStatus.OK);
//            } else {
//                response.put("success", false);
//                response.put("message", "추가실패");
//                return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.put("success", false);
//            response.put("message", "추가오류오류");
//            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//
//    
//    // 일정 수정
//    @PostMapping("/events/modifySchedule")
//    @ResponseBody
//    public ResponseEntity<Map<String, Object>> modifySchedule(@RequestBody Schedule schedule, HttpSession session) {
//    	
//    	// 로그인아이디를 객체에 세팅
//    	String empNo = (String)session.getAttribute("empNo");
//    	schedule.setEmpNo(empNo);
//    	
//    	if(schedule.getSkdTypeCd().equals("employee")) {
//    		String deptCode = skdService.setUserDept(empNo);
//    		schedule.setSkdTypeCd(deptCode);
//    	}
//    	
//    	//log.debug("\u001B[41m" + "RestAPI modifySchedule schedule : " + schedule + "\u001B[0m");
//    	
//        Map<String, Object> response = new HashMap<>();
//
//        try {
//            int row = skdService.modifySchedule(schedule);
//            if (row == 1) {
//                response.put("success", true);
//                return new ResponseEntity<>(response, HttpStatus.OK);
//            } else {
//                response.put("success", false);
//                response.put("message", "수정 실패");
//                return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.put("success", false);
//            response.put("message", "수정 오류");
//            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//    
//    // 일정 삭제
//    @PostMapping("/events/deleteSchedule")
//    @ResponseBody
//    public ResponseEntity<Map<String, Object>> deleteSchedule(int scheduleNo) {
//	    Map<String, Object> response = new HashMap<>();
//
//	    try {
//	        int row = skdService.deleteSchedule(scheduleNo);
//	        if (row == 1) {
//	            response.put("success", true);
//	            return new ResponseEntity<>(response, HttpStatus.OK);
//	        } else {
//	            response.put("success", false);
//	            response.put("message", "삭제실패");
//	            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        response.put("success", false);
//	        response.put("message", "삭제오류");
//	        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
//	    }
//	}
}
