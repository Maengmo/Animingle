package com.sist.animingle.user.repository;

import lombok.Data;

@Data
public class UserDTO {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_address;
	private String user_addressdetail;
	private String user_tel;
	private String user_email;
	private String user_nickname;
	private String user_animalnum;
	private String user_birth;
	private String user_pic;
	private String user_animal;
	
	private String isVet;
	private String isPetsitter;
	private String isAdmin;
	
}
