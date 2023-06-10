package com.sist.animingle.board.repository;

import java.util.Date;

import lombok.Data;

@Data
public class PetsitterAddDTO {
	
	private String psr_writer;
	private String psr_subject;
	private String psr_content;
	private String psr_fromdate;
	private String psr_todate;
	private String psr_region;
	private String psr_regdate;
	private String psr_readcount;

}
