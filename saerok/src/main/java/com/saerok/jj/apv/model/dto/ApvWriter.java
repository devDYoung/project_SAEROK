package com.saerok.jj.apv.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApvWriter {
	private String apvState;
	private Approval apvNo;
	private int apvSeq;
	private String apvEmpNo;
	private Date apvEmpTime;
	private String returnEmpNo;
	private Date returnTime;
	private String returnReason;
}
