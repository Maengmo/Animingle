package com.sist.animingle.user.repository;

import lombok.Data;

@Data
public class PetsitterDTO {
	
	private String ps_id;
	private String ps_pic;
	private String ps_intro;
	private String ps_authdate;
	private String ps_idcard;
	private String ps_crime;
	
	private String ps_rate;
	private String ps_matchcount;
	
}
