package com.saerok.ch.order.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;

public interface OrderService {
    List<OrderList> findAllOrderLists();
    List<OrderListDetail> findOrderDetailsByOrderId(int orderId);
    
    void updateOrderStatus(int orderId, String status);
    void updateInventory(int orderId);
    
    String findOrderStatusByOrderId(int orderId);
    
    
    
    //점주-본인지점 발주리스트 가져오기
    List<OrderList> findBranchOwnerOrderLists(@Param("empNo") String empNo);
    
    void deleteOrderWithDetails(int orderId);

    
    void createOrder(Map<String, Object> orderData);
    void addOrderDetails(List<Map<String, Object>> detailsDataList);
    
    

}
