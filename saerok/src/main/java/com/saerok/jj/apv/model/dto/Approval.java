package com.saerok.jj.apv.model.dto;

import java.sql.Date;

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
	private int apvNo;
	private String apvDocNo;
	private String apvName;
	private String apvCheck;
	private Date regTime;
	private String modId;
	private Date modTime;
	private Employee empNo;
}
