package com.saerok.jy.schedule.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Schedule {
	
	private String scheduleNo; // 일정번호
	private String skdTitle; // 제목
	private String skdContent; // 내용
	private String skdStart; // 시작일
	private String skdEnd; // 종료일
	private String skdTypeCd; // 일정관리구분 01: 개인일정, 02: 부서일정
	private String deptCode; // 부서번호
	private String empNo; // 사원번호 일정 등록한 사람
	private String category; // 일정카테고리 10: 정해진 카테고리1 20: 카테고리2 99: default 카테고리
	private String star; // 중요일정
	private String regDtime; // 등록일
	private String modDtime; // 수정일
//	private String skdStartYmd;
//	private String skdEndYmd;

}
