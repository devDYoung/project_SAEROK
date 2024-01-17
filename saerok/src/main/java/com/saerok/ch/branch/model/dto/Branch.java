package com.saerok.ch.branch.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Branch {
    private int branchNo; 
    private String branchName; 
    private String branchRegion; 
    private String branchTel; 
    private String branchDescription; 
    private String empNo; 
    private String empName; 
    private String empPhone; 
}
