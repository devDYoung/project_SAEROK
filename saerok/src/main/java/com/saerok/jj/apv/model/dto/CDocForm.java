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
	private String cNo; //품의서 고유번호
	private ApvForm DoNo; //보고서양식번호
	private String cTitle; //제목
	private String cDetail; //상세내용
	private Date cDate; //기간
}
