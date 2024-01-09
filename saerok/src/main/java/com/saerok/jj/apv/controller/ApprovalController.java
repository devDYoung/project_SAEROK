package com.saerok.jj.apv.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.saerok.PageFactory;
import com.saerok.jj.apv.model.dto.Approval;
import com.saerok.jj.apv.model.service.ApprovalService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/approval")
public class ApprovalController {
	
	private ApprovalService service;
	private PageFactory pageFactory;
	
	@GetMapping("/approvalList.do")
	public void selectApproval(@RequestParam(defaultValue="1") int cPage,
								@RequestParam(defaultValue="5") int numPerpage,
								Model model) {
		model.addAttribute("approval",
				service.selectApproval(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		model.addAttribute("pageBar",pageFactory.getPage(cPage, numPerpage, 0, "approvalList.do"));
	}
	
	@RequestMapping("/approvalView.do")
	public void selectApprovalByNo(long apvNo, Model model) {
		model.addAttribute("approval",service.selectApprovalByNo(apvNo));
	}
	
	@RequestMapping("/approvalWrite.do")
	public void approvalWrite() {}
	
	@RequestMapping("/insertApproval.do")
	public String insertApproval(Approval a, Model model) {
		int result=service.insertApproval(a);
		String msg,loc;
		if(result>0) {
			msg="등록 성공";
			loc="approval/approvalList.do";
		}else {
			msg="등록실패";
			loc="approval/approvalWrite.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
		
	}
	
}
