 package com.saerok.jy.commute.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Commute {
	
	private int commuteNo; // 출퇴근번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm:ss", timezone="Asia/Seoul" ,locale = "ko_KR")
	private Timestamp inDtime; //출근일시
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm:ss", timezone="Asia/Seoul",locale = "ko_KR")
	private Timestamp outDtime; //퇴근일시
	private String lateYN; //지각여부  Y: 9시 이후 출근인 경우, N: 아닌경우
	private String status; //근무상태 10:출근, 20:퇴근, 30:연차, 40: 반차
	private long overtime; //연장근무시간
	private String workingDay; //근무일
	private String empNo; //사원번호
	private long workingHours;// 근무시간
	
	
	
	
}
