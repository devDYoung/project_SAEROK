package com.saerok.jj.apv.controller;

import java.io.IOException;
import java.io.File;
import java.nio.file.Path;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jh.employee.model.service.EmployeeService;
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
public class ApprovalController {

	private final ApprovalService service;
	private final EmployeeService empService;

	// 전체리스트 조회
	@GetMapping("/approvalList.do")
	public ModelAndView selectApproval(ModelAndView model) {
		List<Approval> approval = service.selectApproval();
		List<Employee> emp = empService.selectEmployeeList();
		List<Object> list = new ArrayList<>();
		list.add(approval);
		list.add(emp);
		model.addObject("list", approval);
		model.addObject("listEmp", emp);
		model.setViewName("approval/approvalList");
		return model;
	}

	// 내문서함 조회
	@GetMapping("/myApproval")
	public void myApproval() {
	}

	// 결재선 사원리스트불러오기
	@GetMapping("/checkDept")
	@ResponseBody
	public List<Map<String, Object>> deptName(Integer deptCode) {
		return service.deptName(deptCode);
	}

	// 폼양식 AJAX 이용
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

	// 폼 등록
	@PostMapping("/insertAppLetter.do")
	@Transactional
	public String insertAppLetter(MultipartFile upFile, AppLetter basicForm,
			String apporvalData, Model model, HttpSession session, @RequestParam String loginEmp) {

		List<Map> approvalList = null;
		try {
			approvalList = new ObjectMapper().readValue(apporvalData, List.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// service.insertAppLetter(basicForm, approvalList);

		int result = 0;
		log.debug("{}", upFile.getOriginalFilename());
		try {
			if (!upFile.isEmpty()) {
				String originalFileName = upFile.getOriginalFilename();
				String destFileName = System.currentTimeMillis() + "_" + originalFileName;
				String path = session.getServletContext().getRealPath("/resources/upload/approvalFile");
				File destFile = new File(path, destFileName);
				upFile.transferTo(destFile);
				basicForm.setOriFileName(originalFileName);
				basicForm.setReFileName(destFileName);
				result = service.insertAppLetter(basicForm, approvalList);
			}

			String msg, loc;
			if (result > 0) {
				return "redirect:/approval/approvalList.do";
			} else {
				msg = "등록실패";
				loc = "/";
			}

			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("msg", "파일 업로드 실패!!!");
			model.addAttribute("loc", "index");
		}

		return "common/msg";
	}

	/*
	 * // 테스트
	 * 
	 * @GetMapping("/test") public void test() { }
	 */
}
