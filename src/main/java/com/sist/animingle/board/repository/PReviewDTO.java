package com.sist.animingle.board.repository;

import lombok.Data;

@Data
public class PReviewDTO {

	private String pr_seq;
	private String pr_writer;
	private String pr_num;
	private String pr_rate;
	private String pr_content;
	private String pr_tag1;
	private String pr_tag2;
	private String pr_tag3;
	private String pr_tag4;
	private String pr_tag5;
	private String pr_regdate;
	private String pr_receipt;
	private String p_seq;
	private String p_name;
	private String p_address;
	private String p_call;
	private String p_open;
	private String p_close;
	private String user_id;
	private String user_nickname;
	private String user_pic;
}
