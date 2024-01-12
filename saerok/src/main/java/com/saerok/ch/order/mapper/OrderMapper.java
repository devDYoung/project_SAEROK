package com.saerok.ch.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;

@Mapper
public interface OrderMapper {
	List<OrderList> findAllOrderLists();
    List<OrderListDetail> findOrderDetailsByOrderId(int orderId);
}
