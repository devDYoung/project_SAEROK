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
	private String empNos;
	
	//품의서
	private int letterSeq; //품의서 고유번호
	private String appEmpName; //결재신청자
	private String letterTitle; //품의서 제목
	private String letterDetail; //상세내용
	private String letterStatus; //문서상태
	private String oriFileName; //원본파일명
	private String reFileName;//수정파일명
	
	//휴가신청서
	private int leaveSeq; //휴가신청서고유번호
	private String leaveClassify; //휴가구분
	private Date leaveStart; //휴가시작일
	private Date leaveEnd; //휴가종료일
	private String leaveDetail; //상세내용
	private String leaveStatus; //문서상태
	private String leaveEmergencyCall; //비상연락망
	
	//지출결의서
	private int cashSeq; //지출 고유번호
	private String cashTitle; //제목
	private String cashDetail; //내용
	private String cashTotalAmount; //총금액
	private String cashAmount; //금액
	private String cashNote; //비고
	private String cashStatus; //문서상태
	
	//참조자
	private int refNo;
	
	//결재자
	private String apvState;
	private int apvNo;
	private String apvEmpNo;
	private String apvEmpName;
	private Date apvEmpTime;
	private String returnReason;

}
