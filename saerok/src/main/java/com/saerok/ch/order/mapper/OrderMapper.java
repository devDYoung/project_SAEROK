package com.saerok.ch.order.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;

@Mapper
public interface OrderMapper {
	List<OrderList> findAllOrderLists();
    List<OrderListDetail> findOrderDetailsByOrderId(int orderId);
    
    void updateOrderStatus(@Param("orderId") int orderId, @Param("status") String status);
   
    String findOrderStatusByOrderId(int orderId);
    
    
    
    
    // 지점주의 발주 목록 조회
    List<OrderList> findBranchOwnerOrderLists(@Param("empNo") String empNo);
    
    void deleteOrderDetails(int orderId);
    void deleteOrder(int orderId);
    
    void createOrder(Map<String, Object> params);
    void addOrderDetail(Map<String, Object> params);
}
