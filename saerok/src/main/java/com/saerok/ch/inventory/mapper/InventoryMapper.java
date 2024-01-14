package com.saerok.ch.inventory.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.saerok.ch.inventory.model.dto.Inventory;

@Mapper
public interface InventoryMapper {
    void increaseStock(@Param("branchNo") int branchNo, @Param("itemId") int itemId, @Param("quantity") int quantity);
    
    List<Inventory> selectInventoryByBranchNo(@Param("branchNo") int branchNo);
    List<Inventory> findInventoryByEmpNo(@Param("empNo") String empNo);


}
