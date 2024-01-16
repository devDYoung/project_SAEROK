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
public class AppCash {
	private String cashSeq; //지출 고유번호
	private Approval appSeq; //전자결재고유번호
	private String cashTitle; //제목
	private String cashDetail; //내용
	private String cashTotalAmount; //총금액
	private String cashAmount; //금액
	private String cashNote; //비고
	private String cashStatus; //문서상태
}
