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
public class CashDocForm {
	private String cashNo;
	private ApvForm DoNo;
	private String caTitle;
	private String caReason;
	private int caCost;
	private String caNote;
}
