
package com.saerok.dy.board.model.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

 // 파일 업로드까지 구현해보기
@Getter
@Setter
public class Board {
	private int boardNo;
	private String boardCategory;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private String oriFileName;
	private String destFileName;
	private String regId;
	private Date regDtime;
	private String modId;
	private Date modDtime;

}
