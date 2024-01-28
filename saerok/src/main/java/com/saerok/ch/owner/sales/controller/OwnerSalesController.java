package com.saerok.ch.owner.sales.controller;


import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
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
        
        //멘토님 model.addAttribute("branchDetailSales2", salesService.getBranchOwnerDetailSales2(empNo));
        model.addAttribute("detailSales", salesService.getBranchOwnerDetailSales(empNo));
        model.addAttribute("monthlySales", salesService.getBranchOwnerCurrentMonthSales(empNo));
        model.addAttribute("categorySales", categorySales);
        
        return "sales/branchOwnerDetail";
    }
    
    @GetMapping("/detail/add")
    public String showAddSalesForm(Model model) {
        List<Map<String, Object>> items = salesService.getAllItems();
        model.addAttribute("items", items);
        
        return "sales/ownerSalesAdd"; 
    }
    
    @Transactional
    @PostMapping("/detail/add")
    public String addSales(
        @RequestParam String salesData, 
        RedirectAttributes redirectAttributes) throws JsonSyntaxException {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Employee loggedInEmployee = (Employee) authentication.getPrincipal();
        String empNo = loggedInEmployee.getEmpNo();

        Gson gson = new Gson();
        Type salesDataType = new TypeToken<List<Map<String, Object>>>(){}.getType();
        List<Map<String, Object>> salesDataList = gson.fromJson(salesData, salesDataType);
        for (Map<String, Object> salesDataMap : salesDataList) {
            salesDataMap.put("empNo", empNo);
        }
        salesService.addBranchSales(salesDataList);
        redirectAttributes.addFlashAttribute("message", "매출이 성공적으로 등록되었습니다.");
        return "redirect:/sales/branchOwnerDetail";
    }

    
    
}





