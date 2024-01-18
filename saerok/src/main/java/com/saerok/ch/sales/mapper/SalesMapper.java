package com.saerok.ch.sales.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SalesMapper {
    
    BigDecimal findTodaySalesTotal();
    
    BigDecimal findCurrentMonthSalesTotal();
    
    BigDecimal findCurrentYearSalesTotal();
    
    List<Map<String, Object>> findMonthlySalesTotals();
    
    List<Map<String, Object>> findCurrentMonthBranchSales();
    
    List<Map<String, Object>> findBranchSales(Map<String, Object> params);

    Map<String, Object> findBranchDetailSales(@Param("branchNo") Integer branchNo);
    
    List<Map<String, Object>> findCurrentMonthSalesByDay(@Param("branchNo") Integer branchNo);
    
    
    
    //점주전용

    List<Map<String, Object>> findBranchOwnerDetailSales(@Param("empNo") String empNo);
    List<Map<String, Object>> findBranchOwnerCurrentMonthSales(@Param("empNo") String empNo);
    List<Map<String, Object>> findCurrentMonthSalesByCategoryForOwner(@Param("empNo") String empNo);

    void insertBranchSales(Map<String, Object> salesData);  //매출등록

}
