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
    private int itemId;            
    private String itemName;       
    private String itemCategory;   
    private int itemPrice;         
}
