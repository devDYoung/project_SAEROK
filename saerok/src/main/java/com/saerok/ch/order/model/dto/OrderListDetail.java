package com.saerok.ch.order.model.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderListDetail {
    private int orderDetailId;    
    private int orderId;          
    private int itemId;           
    private String itemName;      
    private String itemCategory;  
    private int itemPrice;        
    private int quantity;         
    private int branchNo;       
    private BigDecimal totalPrice;

}
