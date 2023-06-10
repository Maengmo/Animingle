package com.sist.animingle.board.find.repository;

import lombok.Data;

@Data
public class FindCDTO {

	private String ffc_seq;
	private String ff_seq;
	private String writer;
	private String content;
	private String regdate;
	
	private String nickname;
	private String ffc_cnt;
	private String clat;
	private String clng;
}
