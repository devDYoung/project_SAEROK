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
public class CDocForm {
	private String cNo;
	private ApvForm DoNo;
	private String cTitle;
	private String cDetail;
	private Date cDate;
}
