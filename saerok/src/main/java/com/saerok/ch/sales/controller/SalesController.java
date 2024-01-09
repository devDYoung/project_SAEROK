package com.saerok.ch.sales.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.saerok.ch.sales.model.service.SalesService;

@Controller
@RequestMapping("/sales")
public class SalesController {

	private final SalesService salesService;

	@Autowired
	public SalesController(SalesService salesService) {
		this.salesService = salesService;
	}

	@GetMapping("/all")
	public String getTodaySalesDetails(Model model) {
		// 일간, 월간, 연간 매출
		BigDecimal todaySalesTotal = salesService.findTodaySalesTotal();
		BigDecimal currentMonthSalesTotal = salesService.findCurrentMonthSalesTotal();
		BigDecimal currentYearSalesTotal = salesService.findCurrentYearSalesTotal();
		model.addAttribute("todaySalesTotal", todaySalesTotal);
		model.addAttribute("currentMonthSalesTotal", currentMonthSalesTotal);
		model.addAttribute("currentYearSalesTotal", currentYearSalesTotal);

		// 월간 매출
		List<Map<String, Object>> monthlySalesTotals = salesService.findMonthlySalesTotals();
		model.addAttribute("monthlySalesTotals", monthlySalesTotals);

		// 지점별 현재 월 매출
		List<Map<String, Object>> currentMonthBranchSales = salesService.findCurrentMonthBranchSales();
		model.addAttribute("currentMonthBranchSales", currentMonthBranchSales);

		return "sales/allSales";

	}

	// 지점별 매출 조회 검색 정렬
	@GetMapping("/branch")
	public String listBranchSales(@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "sortOrder", required = false) String sortOrder, Model model) {
		List<Map<String, Object>> branchSales = salesService.getBranchSales(searchKeyword, sortOrder);
		model.addAttribute("branchSales", branchSales);
		return "sales/branchSales";
	}

	// 선택한 지점 매출 조회
	@GetMapping("/branch/{branchNo}")
	public String getBranchDetail(@PathVariable Integer branchNo, Model model) {
		// 일간매출, 월간매출, 연간매출액
		Map<String, Object> branchDetailSales = salesService.getBranchDetailSales(branchNo);
		model.addAttribute("branchDetailSales", branchDetailSales);
		// 현재 월 매출 일별로 조회
		List<Map<String, Object>> currentMonthSalesByDay = salesService.getCurrentMonthSalesByDay(branchNo);
		model.addAttribute("currentMonthSalesByDay", currentMonthSalesByDay);

		return "sales/branchDetail";
	}

}
