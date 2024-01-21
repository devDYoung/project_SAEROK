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
public class AppLeave {
	private String leaveSeq; //휴가신청서고유번호
	private int appSeq; //전자결재번호
	private String leaveClassify; //휴가구분
	private Date leaveStart; //휴가시작일
	private Date leaveEnd; //휴가종료일
	private String leaveDetail; //상세내용
	private String leaveStatus; //문서상태
	private String leaveEmergencyCall; //비상연락망

}
