package com.sist.animingle.board.find.repository;

import lombok.Data;

@Data
public class FindDTO {
	
	private String seq;
	private String writer;
	private int prefix;
	private String subject;
	private String content;
	private Double lat;
	private Double lng;
	private String regdate;
	private int readcount;
	
	private String nickname;
	private int ffc_cnt;
}
