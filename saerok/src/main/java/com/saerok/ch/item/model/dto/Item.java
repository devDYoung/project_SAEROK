package com.saerok.ch.item.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Item {
    private int itemId;            // 아이템 번호
    private String itemName;       // 아이템 이름
    private String itemCategory;   // 아이템 카테고리
    private int itemPrice;         // 아이템 가격
}
