package com.sist.animingle.board.repository;

import lombok.Data;

@Data
public class WagleCommentDTO {
	private Number wgc_seq;
	private Number wg_seq;
	private String wgc_writer;
	private String wgc_regdate;
	private String wgc_content;
	
	private String wgc_nickname;
	private String user_pic;

}
