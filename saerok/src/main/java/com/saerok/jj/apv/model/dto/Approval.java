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
	private String empNo;//사원번호
	private String appKinds; // 결재종류 

	private List<ApvWriter> apvWriter;//결재선
	private List<ApvRef> apvRef;
	
	private List<AppLetter> file;
	
	
	private String letterSeq; //품의서 고유번호
	private String appEmpName; //결재신청자
	private String letterTitle; //품의서 제목
	private String letterDetail; //상세내용
	private String letterStatus; //문서상태
	private String oriFileName; //원본파일명
	private String reFileName;//수정파일명

}
