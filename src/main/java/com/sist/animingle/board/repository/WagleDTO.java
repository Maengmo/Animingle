package com.sist.animingle.board.repository;

import lombok.Data;

@Data
public class WagleDTO {
	
	private Number wg_seq;
	private String wg_prefix;
	private String wg_subject;
	private String wg_content;
	private String wg_regdate;
	private String wg_writer;
	private Number wg_readcount;
	private String wg_nickname;
	
	private Number wg_ccnt;                      

}
