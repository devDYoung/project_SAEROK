package com.saerok.jj.apv.model.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ApvRef {
	private String refNo;
	private int appSeq;
	private String empNo;
	
}
