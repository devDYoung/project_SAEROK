package com.saerok.ch.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.saerok.ch.inventory.model.dto.Inventory;
import com.saerok.ch.inventory.service.InventoryService;
import com.saerok.jh.employee.model.dto.Employee;

@Controller
public class InventoryController {
    @Autowired
    private InventoryService inventoryService;

    @GetMapping("/inventory")
    public String showInventory(Model model) {
    	
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Employee loggedInEmployee = (Employee) authentication.getPrincipal();
        String empNo = loggedInEmployee.getEmpNo();
        // 재고 목록 가져오기
        List<Inventory> inventoryList = inventoryService.getInventoryForEmployee(empNo);
        
        // 콘솔에 재고 목록 출력
        System.out.println("Inventory List: " + inventoryList);
        System.out.println("empNo: " + empNo);


        model.addAttribute("inventoryList", inventoryList);
        return "inventory/inventoryList"; 
    }
}
