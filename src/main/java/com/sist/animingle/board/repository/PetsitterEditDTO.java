package com.sist.animingle.board.repository;

import java.util.Date;

import lombok.Data;

@Data
public class PetsitterEditDTO {
	
	private String psr_writer;
	private String psr_subject;
	private String psr_content;
	private Date psr_fromdate;
	private Date psr_todate;
	private String psr_region;
	private String psr_readcount;

}
