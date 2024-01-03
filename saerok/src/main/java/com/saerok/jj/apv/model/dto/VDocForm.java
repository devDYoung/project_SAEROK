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
public class VDocForm {
	private String vNo;
	private ApvForm DoNo;
	private String vType;
	private String vReason;
	private Date vStartDate;
	private String vDetail;
	private Date vEndDate;

}
