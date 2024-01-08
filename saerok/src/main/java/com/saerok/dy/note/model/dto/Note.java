package com.saerok.dy.note.model.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Note {
	private int noteNo;
	private String revEmpNo;
	private String sndEmpNo;
	private String noteTitle;
	private String readYn;
	private String delYn;
	private String tempYn;
	private String regId;
	private Date regDtime;
	private String modId;
	private Date modDtime;
}
