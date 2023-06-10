package com.sist.animingle.board.repository;

import java.util.Date;

import lombok.Data;

@Data
public class PetsitterViewDTO {
	
	private String psr_seq;
	private String psr_writer;
	private String psr_subject;
	private String psr_content;
	private Date psr_fromdate;
	private Date psr_todate;
	private String psr_region;
	private String psr_state;
	private Date psr_regdate;
	private String psr_readcount;
	
	private String user_id;
	private String user_nickname;
	private String user_pic;
	
	private String psa_seq;
	private String ps_id;
	private String ps_pic;
	private String ps_intro;
	private String psa_applydate;
	private String psa_adoptdate;
	
	private String ps_cnt;
	private String rate;
	
}
