package com.saerok.jy.schedule.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Schedule {
	
	private int scheduleNo;
	private String skdTitle;
	private String skdContent;
	private Date skdStart;
	private Date skdEnd;
	private String skdTypeCd;
	private String deptCode;
	private String category;

}
