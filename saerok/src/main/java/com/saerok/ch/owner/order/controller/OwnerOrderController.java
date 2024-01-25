package com.saerok.ch.owner.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;
import com.saerok.ch.order.service.OrderService;
import com.saerok.jh.employee.model.dto.Employee;

@Controller
@RequestMapping("/owner/order")
public class OwnerOrderController {
	
	private final OrderService orderService;
	
	@Autowired
	public OwnerOrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@GetMapping("/detail")
	public String getOrder(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Employee loggedInEmployee = (Employee) authentication.getPrincipal();
		String empNo = loggedInEmployee.getEmpNo();
		
		List<OrderList> orderLists = orderService.findBranchOwnerOrderLists(empNo);
		model.addAttribute("orderLists", orderLists);

		return "order/orderOwnerView";
	}
	
	
	
    @GetMapping("/two/{orderId}")
    public String listOrderDetails(@PathVariable int orderId, Model model) {
        List<OrderListDetail> orderDetails = orderService.findOrderDetailsByOrderId(orderId);
        String orderStatus = orderService.findOrderStatusByOrderId(orderId); 

        model.addAttribute("orderDetails", orderDetails);
        model.addAttribute("orderStatus", orderStatus); 
        return "order/orderOwnerDetails"; 
    }
    
    
   
	

	


}
