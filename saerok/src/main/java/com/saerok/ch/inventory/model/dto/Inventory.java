package com.saerok.ch.inventory.model.dto;

import com.saerok.ch.item.model.dto.Item;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Inventory {
    private int inventoryId;
    private int branchNo;
    private int itemId;
    private int stock;         // 현재 재고
    private int bufferStock;   // 버퍼 재고
    private String itemName;   
    private String itemCategory; 

    
}
