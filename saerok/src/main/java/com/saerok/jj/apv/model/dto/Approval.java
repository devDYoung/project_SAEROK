package com.saerok.jj.apv.model.dto;

import java.sql.Date;
import java.util.List;

import com.saerok.jh.employee.model.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Approval {
	private int appSeq; //결재고유번호
	private Date appWriteDate; //작성일자
	private String appCheck; //결재상태
	private Employee empNo;//사원번호
	private String appKinds; // 결재종류 

	private List<ApvWriter> apvWriter;//결재선
	private List<ApvRef> apvRef;
	
}
