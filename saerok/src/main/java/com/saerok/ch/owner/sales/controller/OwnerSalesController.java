package com.saerok.ch.owner.sales.controller;


import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @GetMapping("/sales")
    public String showSales(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Employee loggedInEmployee = (Employee) authentication.getPrincipal();
        String empNo = loggedInEmployee.getEmpNo();

        BigDecimal todaySales = salesService.findOwnerTodaySalesTotal(empNo);
        BigDecimal monthSales = salesService.findOwnerCurrentMonthSalesTotal(empNo);
        BigDecimal yearSales = salesService.findOwnerCurrentYearSalesTotal(empNo);

        model.addAttribute("todaySales", todaySales);
        model.addAttribute("monthSales", monthSales);
        model.addAttribute("yearSales", yearSales);

        return "sales/ownerAllSales";
    }
}