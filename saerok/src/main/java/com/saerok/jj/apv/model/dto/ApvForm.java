package com.saerok.jj.apv.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApvForm {
	private String doNo;
	private Approval apvNo;
	private String formState;
}
