package com.saerok.jj.apv.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jj.apv.model.dto.AppLetter;
import com.saerok.jj.apv.model.dto.Approval;
import com.saerok.jj.apv.model.service.ApprovalService;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@AllArgsConstructor
@RequestMapping("/approval")
@Slf4j
@SessionAttributes("loginEmployee")
public class ApprovalController {

	private ApprovalService service;

	@GetMapping("/approvalList.do")
	public String selectApproval(Model model) {
	    List<Approval> approval = service.selectApproval();
	    Employee emp = new Employee(); 

	    List<Object> list = new ArrayList<>();
	    list.add(approval);
	    list.add(emp);
	    
	    model.addAttribute("list", list);
	    return "approval/approvalList";
	}
	
	

	// 결재선 사원리스트불러오기
	@GetMapping("/checkDept")
	@ResponseBody
	public List<Map<String, Object>> deptName(Integer deptCode) {
		return service.deptName(deptCode);
	}

	// 폼양식
	@GetMapping("/docForms")
	public String loadDocumentForm(@RequestParam(value = "docType", defaultValue = "D1") String docType, Model model) {
		switch (docType) {
		case "D1":
			return "approval/docForms";// 일반
		case "D2":
			return "approval/vacationForm"; // 휴가
		case "D3":
			return "approval/cashForm"; // 지출
		default:
			throw new IllegalArgumentException("지정된 양식이 없습니다.");
		}
	}

	// 기본 폼양식
	@GetMapping("/basicForm")
	public void basicForm() {
	}
	
	
	  //폼 등록
	  
	  @PostMapping("/insertAppLetter.do")
	  public String insertAppLetter(MultipartFile upFile , AppLetter basicForm, Approval a, Model
	  model, HttpSession session, @RequestParam String loginEmp) {
	  a.setEmpNo(loginEmp); a.setAppKinds("APPLETTER"); service.insertAppLetter(upFile,basicForm);
	  basicForm.setAppSeq(a.getAppSeq()); 
	  //String reFileName = service.uploadFile(upFile, session); // 서비스 메서드를 호출합니다.
	  
	  System.out.println(a); 
	  System.out.println(basicForm); return "common/msg"; }
	 
	
	// 테스트
	@GetMapping("/test")
	public void test() {
	}

}
