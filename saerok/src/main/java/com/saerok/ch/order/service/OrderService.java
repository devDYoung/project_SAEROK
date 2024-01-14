package com.saerok.ch.order.service;

import java.util.List;

import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;

public interface OrderService {
    List<OrderList> findAllOrderLists();
    List<OrderListDetail> findOrderDetailsByOrderId(int orderId);
    
    void updateOrderStatus(int orderId, String status);
    void updateInventory(int orderId);
    
    String findOrderStatusByOrderId(int orderId);

}
