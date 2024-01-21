package com.saerok.jj.apv.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.saerok.jh.employee.model.dto.Employee;
import com.saerok.jh.employee.model.service.EmployeeService;
import com.saerok.jj.apv.model.dto.AppLetter;
import com.saerok.jj.apv.model.dto.Approval;
import com.saerok.jj.apv.model.service.ApprovalService;

import jakarta.servlet.http.HttpServletRequest;
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
	
	private EmployeeService empService;

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
	
	
	
	// 파일첨부 관련
	private String saveAppFile(MultipartFile file, HttpServletRequest request) {
	    String originalFileName = null;
	    String renameFileName = null;
	    String renamePath = null;
	    String rootPath = request.getSession().getServletContext().getRealPath("resources");
	    String savePath = rootPath + "/upload/approvalFile";

	    log.info("Root Path : " + rootPath);
	    log.info("Save Path : " + savePath);

	    File folder = new File(savePath); // Save Path가 실제로 존재하지 않으면 폴더를 생성하는 로직

	    if (!folder.exists()) {
	        folder.mkdirs();
	    }

	    originalFileName = file.getOriginalFilename();
	    renameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"))
	            + originalFileName.substring(originalFileName.lastIndexOf("."));
	    renamePath = savePath + "/" + renameFileName;

	    try {
	        file.transferTo(new File(renamePath)); // 업로드 한 파일 데이터를 지정한 파일에 저장한다.
	    } catch (IOException e) {
	        log.error("파일 전송 에러 : " + e.getMessage(), e);
	        throw new RuntimeException("파일 전송 중 에러 발생", e); // 실패 시 예외를 던져서 해당 요청을 중단시킵니다.
	    }

	    return renameFileName;
	}

}
