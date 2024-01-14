package com.saerok.ch.order.mapper;

import java.util.List;

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

}
