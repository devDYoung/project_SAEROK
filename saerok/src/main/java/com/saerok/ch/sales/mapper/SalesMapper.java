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
    //멘토님 Map<String, Object> findBranchOwnerDetailSales2(@Param("empNo") String empNo);
    List<Map<String, Object>> findBranchOwnerDetailSales(@Param("empNo") String empNo);
    List<Map<String, Object>> findBranchOwnerCurrentMonthSales(@Param("empNo") String empNo);
    List<Map<String, Object>> findCurrentMonthSalesByCategoryForOwner(@Param("empNo") String empNo);
    
    //매출등록
    List<Map<String, Object>> findAllItems();
    void insertBranchSales(Map<String, Object> params);
    void updateInventoryStock(Map<String, Object> params);
}
