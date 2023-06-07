package com.sist.animingle.board.repository;

import java.util.Date;

import lombok.Data;

@Data
public class VetQnAViewDTO {
	
	private String user_nickname; 
	private String user_id; 
	private String user_pic;
	private String vq_seq;
	private String vq_subject; 
	private String vq_content; 
	private Date vq_regdate; 
	private String vq_readcount; 
	private String vq_prefix;
	private String vqr_seq;
	private Date vqr_regdate; 
	private String vqr_content; 
	private String vet_seq; 
	private String vet_clinic; 
	private String vqrc_writer;
	private String vqrc_content;
	private Date vqrc_regdate;
	private String vqrc_cnt;
	private String vqr_cnt;
	private String answer_cnt;
	private String comment_cnt;
	
}
