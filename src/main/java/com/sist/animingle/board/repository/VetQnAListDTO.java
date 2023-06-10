package com.sist.animingle.board.repository;

import java.util.Date;

import lombok.Data;

@Data
public class VetQnAListDTO {
	
	private String vq_seq;			//게시글 번호
	private String vq_writer;		//작성자
	private String vq_subject;		//제목
	private String vq_prefix;		//말머리
	private String vq_content;		//본문
	private Date vq_regdate;		//작성 날짜
	private String vq_readcount;	//조회수
	private String answer_cnt;

}
