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
    private int branchNo; // 지점 번호
    private String branchName; // 지점 이름
    private String branchRegion; // 지점 지역
    private String branchTel; // 지점 전화번호
    private String branchDescription; // 지점 설명
    private String empNo; // 지점장 아이디
    private String empName; // 지점장 이름
    private String empPhone; // 지점장 전화번호
}
