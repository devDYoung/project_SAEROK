package com.saerok.jy.commute.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saerok.jy.commute.dto.Commute;
import com.saerok.jy.commute.service.CommuteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
//@RequiredArgsConstructor
@RequestMapping("/commute")
public class CommuteController {

	@Autowired
	private CommuteService commuteService;
	
	DateTimeFormatter dayff = DateTimeFormatter.ofPattern("yy-MM"); //날짜 패턴 변경
	DateTimeFormatter dayfff = DateTimeFormatter.ofPattern("yy/MM"); //날짜 패턴 변경
	DateTimeFormatter dayf = DateTimeFormatter.ofPattern("yy-MM-dd"); //날짜 패턴 변경
	LocalDateTime now = LocalDateTime.now(); //현재 시간
	
	// 금일 근무 기록 조회
	@PostMapping("/commute.do")
	public ResponseEntity<Commute> selectCommuteList(HttpSession session, ModelAndView mv, Principal loginSession) {

		// 현재 로그인 중인 사원의 사원번호
		String empNo = loginSession.getName();
		String time = now.format(dayf); //현재날짜를 yy/MM/dd 형식으로 변경
		 Map<String,Object> param = new HashMap<>();
		 param.put("empNo", empNo);
		 param.put("time", time);
		
		 Commute commute = commuteService.selectCommuteList(param);
		 
		 return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON.toString())
					.body(commute);
		
		
	}

	// 출퇴근버튼 눌렀을 때
	@PostMapping("/workIn.do")
    @ResponseBody
	public Map<String, Object> workIn(Model model, HttpSession session, HttpServletRequest request, Principal loginSession) {
		// 사원번호
		String empNo = loginSession.getName();

		// 상태
		String status = request.getParameter("status");
		LocalDateTime checkDate = LocalDateTime.now();
		String time = now.format(dayf);
		Map param = new HashMap();
		param.put("status", status);
		param.put("empNo", empNo);
		
		//Commute commute = commuteService.selectCommuteList(param);
		
		String lateYN = "N";
		if (checkDate.getHour() > 9) {
			lateYN = "Y";
		} 
		param.put(lateYN, lateYN);
		
		int result = commuteService.insertCommuteStatus(param);
		Map<String, Object> returnResult =  new HashMap<>();
		returnResult.put("lateYN", lateYN);
		if(result > 0) {
			returnResult.put("successYn", "Y");
			returnResult.put("indtime",
					new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss")
					.format((Date)param.get("indtime")));
		}else {
			returnResult.put("successYn", "N");
		}
		return returnResult;
		
	}
		
	
	@PostMapping("/workOut.do")
	@ResponseBody
	public Map<String, Object> workOut(Model model, HttpSession session, HttpServletRequest request, Principal loginSession) {
	    // 사원번호
	    String empNo = loginSession.getName();
	    
	    // 퇴근 시간 설정
	    String status = request.getParameter("status");
	    LocalDateTime checkDate = LocalDateTime.now();
	    Map param = new HashMap();
	    param.put("status", "20"); 
	    param.put("empNo", empNo);
	   
	    int result = commuteService.updateCommuteEndTime(param); // 퇴근 시간 업데이트
	    
	    Map<String, Object> returnResult =  new HashMap<>();
	    if (result > 0) {
	        returnResult.put("successYn", "Y");
	       // returnResult.put("outTime", checkDate.toString()); // 퇴근 시간 반환
	        returnResult.put("outdtime", new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss")
					.format((Date)param.get("outdtime")));
	    } else {
	        returnResult.put("successYn", "N");
	    }

	    return returnResult;
	}
	
	
	
	//퇴근버튼 눌렀을시 오늘 근무시간 업데이트
	@PostMapping("/updateWorkTime.do")
	public ResponseEntity<?> updateWorkTime(Long daytimes, Principal loginSession) {
		
		long daytime = daytimes; // 기본근무시간
		long overtime = 0; //연장근무시간
		
		// 5시간 이상 일했을 시 점심시간 1시간 제외
		if(daytimes > 18000000) {
			daytime = daytimes - 3600000;
		}
		
		//근무시간이 8시간이 넘었을때 기본근무시간과 연장근무시간 처리
		if(daytime > 28800000) {
			overtime = daytime - 28800000;
			daytime = 28800000;
		}
		
		String empNo = loginSession.getName();
		String time = now.format(dayf);
		
		Map<String,Object> param = new HashMap<>();
		param.put("empNo", empNo);
		param.put("time", time);
		param.put("daytime", daytime);
		param.put("overtime", overtime);
		
		Commute commute = commuteService.selectCommuteList(param);
		int result = 0;
		if(commute.getStatus().equals("반차")) {
			result = commuteService.updateHalfDayOff(param); //반차 근무시간 업데이트시 4시간 추가 
		}else {
			result = commuteService.updateWorkTime(param); // 금일 근무시간 업데이트
		}
		
		Map<String,Object> status = new HashMap<>();
		if(result > 0)
			status.put("status", "성공");	
		
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON.toString())
				.body(status);
	}
	
	// 달의 전체 commute, 그 달의 주차별 시작,종료일 가져오기 (table에 뿌려주는 용도)
	@ResponseBody
	@GetMapping("/selectMonthWork.do")
	public ResponseEntity<?> selectMonthWork(String dateText,Principal loginSession) {

	    String empNo = loginSession.getName();

	    LocalDate currentDate = LocalDate.parse(dateText + ".01", DateTimeFormatter.ofPattern("yyyy.MM.dd"));

	    // 주간별 누적근무시간
	    Map<String, Map<String, Object>> weekDates = new HashMap<>();

	    // 주차별로 반복
	    for (int week = 1; week <= currentDate.lengthOfMonth() / 7 + 1; week++) {
	        LocalDate startOfWeek = currentDate.withDayOfMonth((week - 1) * 7 + 1);
	        LocalDate endOfWeek = currentDate.withDayOfMonth(week * 7).plusDays(6);

	        // 주간별 누적 기본 근무시간 가져오기
	        Map<String, Object> startEndMap = new HashMap<>();
	        startEndMap.put("empNo", empNo);
	        startEndMap.put("start", startOfWeek);
	        startEndMap.put("end", endOfWeek);

	        int workTimes = commuteService.selectWeekWorkTime(startEndMap);

	        // 주간별 연장 근무시간 가져오기
	        int weekOverTime = commuteService.selectWeekOverTime(startEndMap);

	        Map<String, Object> weekData = new HashMap<>();
	        weekData.put("start", startOfWeek);
	        weekData.put("end", endOfWeek);
	        weekData.put("workTime", workTimes);
	        weekData.put("workOverTime", weekOverTime);

	        weekDates.put("week" + week, weekData);
	    }

	    Map<String, Object> response = new HashMap<>();
	    response.put("weekDates", weekDates);

	    return ResponseEntity.ok()
	            .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON.toString())
	            .body(response);
	}

	
	
	// 주차 클릭시 start,end 사이 날짜 근무 가져오기
	@ResponseBody
	@GetMapping("/selectWeekDatas.do")
	public ResponseEntity<?> selectWeekDatas(String start, String end,Principal loginSession){

		String empNo = loginSession.getName();
		
		Map<String,Object> param = new HashMap<>();
		param.put("empNo", empNo);
		param.put("start", start);
		param.put("end", end);
		List<Commute> weekList = commuteService.selectWeekDatas(param);
		
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON.toString())
				.body(weekList);
	}


}
