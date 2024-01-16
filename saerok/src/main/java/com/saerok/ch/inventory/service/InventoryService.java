package com.saerok.ch.inventory.service;

import com.saerok.ch.inventory.model.dto.Inventory;
import java.util.List;

public interface InventoryService {
    List<Inventory> getInventoryByBranchNo(int branchNo);
    List<Inventory> getInventoryForEmployee(String empNo);

}
