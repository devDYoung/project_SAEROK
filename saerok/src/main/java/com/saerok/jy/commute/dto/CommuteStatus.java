package com.saerok.jy.commute.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommuteStatus {
	
	
	private int statusNo;
	private int commuteNo;
	private int statusCode;
	private String statusName;
	private String occurTime;

}
