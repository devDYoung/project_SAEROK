package com.saerok.ch.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;
import com.saerok.ch.order.service.OrderService;

@Controller
public class OrderController {
    private final OrderService orderService;

    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/orders")
    public String listOrders(Model model) {
        List<OrderList> orders = orderService.findAllOrderLists();
        System.out.println("Orders: " + orders); // 콘솔에 주문 목록 출력

        model.addAttribute("orders", orders);
        return "order/orders"; // 발주 목록을 보여주는 JSP 페이지
    }
    
    @GetMapping("/orders/{orderId}")
    public String listOrderDetails(@PathVariable int orderId, Model model) {
        List<OrderListDetail> orderDetails = orderService.findOrderDetailsByOrderId(orderId);
        System.out.println("Order Details for Order ID " + orderId + ": " + orderDetails); // 콘솔에 발주 상세 목록 출력

        model.addAttribute("orderDetails", orderDetails);
        return "order/orderDetails"; // 발주 상세 목록을 보여주는 JSP 페이지
    }
}
