package com.saerok.ch.owner.sales.controller;


import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.saerok.ch.sales.model.service.SalesService;
import com.saerok.jh.employee.model.dto.Employee;

@Controller
@RequestMapping("/owner")
public class OwnerSalesController {
	
	private final SalesService salesService;

	@Autowired
	public OwnerSalesController(SalesService salesService) {
		this.salesService = salesService;
	}

   
    @GetMapping("/detail")
    public String getSales(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Employee loggedInEmployee = (Employee) authentication.getPrincipal();
        String empNo = loggedInEmployee.getEmpNo();
        
        List<Map<String, Object>> categorySales = salesService.getCurrentMonthSalesByCategoryForOwner(empNo);

        model.addAttribute("detailSales", salesService.getBranchOwnerDetailSales(empNo));
        model.addAttribute("monthlySales", salesService.getBranchOwnerCurrentMonthSales(empNo));
        model.addAttribute("categorySales", categorySales);
        
        return "sales/branchOwnerDetail";
    }
    
    // 매출 등록 폼 페이지
    @GetMapping("/sales/entry")
    public String showSalesEntryPage() {
        return "sales/salesEntry"; 
       
    }

    // 매출 데이터 처리
    @PostMapping("/sales/add")
    public String addSales(@RequestParam Map<String, Object> salesData, Model model) {
        try {
            salesService.addBranchSales(salesData); 
            model.addAttribute("message", "매출이 성공적으로 등록되었습니다.");
        } catch (Exception e) {
            model.addAttribute("message", "매출 등록에 실패했습니다.");
        }
        return "redirect:/owner/sales/entry";
    }
}