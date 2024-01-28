package com.saerok.ch.owner.order.controller;

import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;
import com.saerok.ch.order.service.OrderService;
import com.saerok.ch.sales.model.service.SalesService;
import com.saerok.jh.employee.model.dto.Employee;

@Controller
@RequestMapping("/owner/order")
public class OwnerOrderController {
	
	   private final OrderService orderService;
	    private final SalesService salesService; 

	    @Autowired
	    public OwnerOrderController(OrderService orderService, SalesService salesService) {
	        this.orderService = orderService;
	        this.salesService = salesService; 
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
    
    @Transactional
    @PostMapping("/two/{orderId}")
    public String deleteOrder(@PathVariable int orderId, RedirectAttributes redirectAttributes) {
        orderService.deleteOrderWithDetails(orderId);
        redirectAttributes.addFlashAttribute("message", "주문이 성공적으로 삭제되었습니다.");
        return "redirect:/owner/order/two/" + orderId;
    }
    
    
    @GetMapping("/add")
    public String showAddSalesForm(Model model) {
        List<Map<String, Object>> items = salesService.getAllItems(); // SalesService에서 아이템 목록 가져오기
        model.addAttribute("items", items);

        return "order/orderAdd"; 
    }
    

    @Transactional
    @PostMapping("/add")
    public String addOrder(
    	    @RequestParam String jsonData, 
    	    RedirectAttributes redirectAttributes) throws JsonSyntaxException {

        Gson gson = new Gson(); 
        Type type = new TypeToken<Map<String, Object>>(){}.getType();
        Map<String, Object> orderMap = gson.fromJson(jsonData, type);


        // 현재 로그인된 사용자의 EMP_NO 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Employee loggedInEmployee = (Employee) authentication.getPrincipal();
        String empNo = loggedInEmployee.getEmpNo();

        // 주문 데이터에 EMP_NO 추가
        Map<String, Object> orderData = (Map<String, Object>) orderMap.get("order");
        orderData.put("empNo", empNo);

        // 주문 생성
        orderService.createOrder(orderData);

        // 주문 세부사항 추가
        List<Map<String, Object>> detailsDataList = (List<Map<String, Object>>) orderMap.get("details");
        orderService.addOrderDetails(detailsDataList);

        redirectAttributes.addFlashAttribute("message", "주문이 성공적으로 추가되었습니다.");
        return "redirect:/owner/order/detail";
    }

   
	

	


}
