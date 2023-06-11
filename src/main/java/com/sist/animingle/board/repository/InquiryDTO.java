package com.sist.animingle.board.repository;

import lombok.Data;

@Data
public class InquiryDTO {
	private String in_seq;
	private String in_writer;
	private String in_subject;
	private String in_prefix;
	private String in_content;
	private String in_regdate;
	private String nickname;
	private String answerCnt;
	
	//일자별 갯수
	private String cnt1;
	private String cnt2;
}
