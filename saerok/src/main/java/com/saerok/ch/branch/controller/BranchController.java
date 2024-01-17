package com.saerok.ch.branch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.saerok.ch.branch.model.dto.Branch;
import com.saerok.ch.branch.service.BranchService;

@Controller  
@RequestMapping("/branch")
public class BranchController {

    private final BranchService branchService;

    @Autowired
    public BranchController(BranchService branchService) {
        this.branchService = branchService;
    }
   

    // 모든 지점 조회
    @GetMapping("/")
    public String listBranches(@RequestParam(value = "searchKeyword", required = false) String searchKeyword, Model model) {
        model.addAttribute("branches", branchService.findAllBranches(searchKeyword));
        return "branch/branchList";
    }
    
    // 지점 등록 폼 페이지
    @GetMapping("/add")
    public String addBranchForm() {
        return "branch/addBranch";
    }

    // 지점 등록 처리
    @PostMapping("/")
    public String addBranch(Branch branch) {
        branchService.addBranch(branch);
        return "redirect:/branch/";
    }
    
    // 지점 정보 수정 폼 페이지
    @GetMapping("/update/{branchNo}")
    public String updateBranchForm(@PathVariable int branchNo, Model model) {
        Branch branch = branchService.findBranchById(branchNo); 
        model.addAttribute("branch", branch);
        return "branch/updateBranch"; 
    }

    // 지점 정보 수정 처리
    @PostMapping("/update/{branchNo}")
    public String updateBranch(@PathVariable int branchNo, Branch branch) {
        branch.setBranchNo(branchNo); 
        branchService.updateBranch(branch);
        return "redirect:/branch/"; 
    }
    
    // 지점 삭제 처리
    @DeleteMapping("/{branchNo}")
    public String deleteBranch(@PathVariable int branchNo) {
        branchService.deleteBranch(branchNo);
        return "redirect:/branch/";
    }
}
