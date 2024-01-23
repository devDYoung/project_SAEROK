package com.saerok.ch.sales.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Sales {
    private String empNo;
    private String itemId;
    private int quantity;
    private String salesDate;   
}
