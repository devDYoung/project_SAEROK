package com.saerok.ch.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.saerok.ch.order.mapper.OrderMapper;
import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;

@Service
public class OrderServiceImpl implements OrderService {
    private final OrderMapper orderMapper;

    @Autowired
    public OrderServiceImpl(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public List<OrderList> findAllOrderLists() {
        return orderMapper.findAllOrderLists();
    }
    
    @Override
    public List<OrderListDetail> findOrderDetailsByOrderId(int orderId) {
        return orderMapper.findOrderDetailsByOrderId(orderId);
    }
}
