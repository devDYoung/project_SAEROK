package com.saerok.ch.sales.model.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.saerok.ch.sales.mapper.SalesMapper;

@Service
public class SalesServiceImpl implements SalesService {

    private final SalesMapper salesMapper;

    public SalesServiceImpl(SalesMapper salesMapper) {
        this.salesMapper = salesMapper;
    }
    
    @Override
    public BigDecimal findTodaySalesTotal() {
        return salesMapper.findTodaySalesTotal();
    }

    @Override
    public BigDecimal findCurrentMonthSalesTotal() {
        return salesMapper.findCurrentMonthSalesTotal();
    }

    @Override
    public BigDecimal findCurrentYearSalesTotal() {
        return salesMapper.findCurrentYearSalesTotal();
    }
    
    @Override
    public List<Map<String, Object>> findMonthlySalesTotals() {
        return salesMapper.findMonthlySalesTotals();
    }
    
    @Override
    public List<Map<String, Object>> findCurrentMonthBranchSales() {
        List<Map<String, Object>> salesList = salesMapper.findCurrentMonthBranchSales();
        for (Map<String, Object> sale : salesList) {
            String monthNumber = sale.get("salesMonth").toString(); 
            String monthString = getMonthString(monthNumber);   
            sale.put("salesMonth", monthString);               
        }
        return salesList;
    }
    
    @Override
    public List<Map<String, Object>> getBranchSales(String searchKeyword, String sortOrder) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchKeyword", searchKeyword);
        params.put("sortOrder", sortOrder);
        return salesMapper.findBranchSales(params);
    }
    
    @Override
    public Map<String, Object> getBranchDetailSales(Integer branchNo) {
        return salesMapper.findBranchDetailSales(branchNo);
    }

    @Override
    public List<Map<String, Object>> getCurrentMonthSalesByDay(Integer branchNo) {
        List<Map<String, Object>> salesList = salesMapper.findCurrentMonthSalesByDay(branchNo);
        for (Map<String, Object> sale : salesList) {
            String monthNumber = sale.get("currentMonth").toString();
            String monthString = getMonthString(monthNumber);
            sale.put("currentMonth", monthString);

            String salesDay = sale.get("salesDay").toString();
            String dayString = getDayString(salesDay); 
            sale.put("salesDay", dayString);
        }
        return salesList;
    }

    private String getDayString(String dayNumber) {
        int day = Integer.parseInt(dayNumber);
        return String.valueOf(day); 
    }
   
    private String getMonthString(String monthNumber) {
        int month = Integer.parseInt(monthNumber);
        switch (month) {
            case 1: return "1월";
            case 2: return "2월";
            case 3: return "3월";
            case 4: return "4월";
            case 5: return "5월";
            case 6: return "6월";
            case 7: return "7월";
            case 8: return "8월";
            case 9: return "9월";
            case 10: return "10월";
            case 11: return "11월";
            case 12: return "12월";
            default: return monthNumber; 
        }
    }
    
}
