package com.saerok.ch.order.model.dto;

import java.math.BigDecimal;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderList {
    private int orderId;
    private String branchName; 
    private Date orderDate;
    private int totalQuantity; 
    private BigDecimal totalAmount; 
    private String orderStatus;
}