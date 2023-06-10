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
}
