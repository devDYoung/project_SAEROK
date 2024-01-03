package com.saerok.jj.apv.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApvDocFile {
	private String ApvDocNo;
	private Approval apvNo;
	private String oriFileName;
	private String reFileName;
	
}
