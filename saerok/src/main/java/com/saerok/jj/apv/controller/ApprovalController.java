package com.saerok.jj.apv.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.saerok.PageFactory;
import com.saerok.jj.apv.model.dto.Approval;
import com.saerok.jj.apv.model.service.ApprovalService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@AllArgsConstructor
@RequestMapping("/approval")
@Slf4j
public class ApprovalController {

	private ApprovalService service;
	private PageFactory pageFactory;

	@GetMapping("/approvalList.do")
	public void selectApproval(@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage, Model model) {
		List<Approval> approval = service.selectApproval(Map.of("cPage", cPage, "numPerpage", numPerpage));

		model.addAttribute("approval", approval);
		model.addAttribute("pageBar", pageFactory.getPage(cPage, numPerpage, 0, "approvalList.do"));
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
	
	
	// 테스트
	@GetMapping("/test")
	public void test() {
	}

}
