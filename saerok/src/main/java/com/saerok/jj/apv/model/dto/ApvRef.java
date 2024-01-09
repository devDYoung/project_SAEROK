package com.saerok.jj.apv.model.dto;

import com.saerok.jh.employee.model.dto.Employee;

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
	private String refCc;
	private Employee empNo;
	
}
