package com.saerok.ch.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saerok.ch.inventory.mapper.InventoryMapper;
import com.saerok.ch.order.mapper.OrderMapper;
import com.saerok.ch.order.model.dto.OrderList;
import com.saerok.ch.order.model.dto.OrderListDetail;

@Service
public class OrderServiceImpl implements OrderService {
    private final OrderMapper orderMapper;
    private final InventoryMapper inventoryMapper;

    @Autowired
    public OrderServiceImpl(OrderMapper orderMapper, InventoryMapper inventoryMapper) {
        this.orderMapper = orderMapper;
        this.inventoryMapper = inventoryMapper;
    }

    @Override
    public List<OrderList> findAllOrderLists() {
        return orderMapper.findAllOrderLists();
    }
    
    @Override
    public List<OrderListDetail> findOrderDetailsByOrderId(int orderId) {
        return orderMapper.findOrderDetailsByOrderId(orderId);
    }
    
    
    @Override
    public String findOrderStatusByOrderId(int orderId) {
        return orderMapper.findOrderStatusByOrderId(orderId);
    }
    
    @Override
    public void updateOrderStatus(int orderId, String status) {
        orderMapper.updateOrderStatus(orderId, status);
    }

    @Transactional
    @Override
    public void updateInventory(int orderId) {
        List<OrderListDetail> details = orderMapper.findOrderDetailsByOrderId(orderId);
        for (OrderListDetail detail : details) {
            System.out.println("Branch No: " + detail.getBranchNo() + ", Item ID: " + detail.getItemId() + ", Quantity: " + detail.getQuantity());
            inventoryMapper.increaseStock(detail.getBranchNo(), detail.getItemId(), detail.getQuantity());
        }
    }

    
    
}
