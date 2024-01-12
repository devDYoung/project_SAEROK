package com.saerok.ch.order.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderListDetail {
    private int orderDetailId;    // 발주 상세 ID
    private int orderId;          // 발주 ID
    private int itemId;           // 아이템 ID
    private String itemName;      // 아이템 이름
    private String itemCategory;  // 아이템 카테고리
    private int itemPrice;        // 아이템 가격
    private int quantity;         // 수량
}
