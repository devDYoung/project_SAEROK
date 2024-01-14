package com.saerok.ch.inventory.service;

import com.saerok.ch.inventory.mapper.InventoryMapper;
import com.saerok.ch.inventory.model.dto.Inventory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class InventoryServiceImpl implements InventoryService {

    @Autowired
    private InventoryMapper inventoryMapper;

    @Override
    public List<Inventory> getInventoryByBranchNo(int branchNo) {
        return inventoryMapper.selectInventoryByBranchNo(branchNo);
    }
    
    @Override
    public List<Inventory> getInventoryForEmployee(String empNo) {
        return inventoryMapper.findInventoryByEmpNo(empNo);
    }
}
