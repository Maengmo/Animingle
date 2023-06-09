package com.sist.animingle.user.repository;

import lombok.Data;

@Data
public class PSApplyDTO {
	
	private String psa_seq;
	private String ps_id;
	private String psr_seq;
	private String psa_applydate;
	private String psa_adoptdate;
	
	private String psr_subject;
	
	private String psa_state;

}
