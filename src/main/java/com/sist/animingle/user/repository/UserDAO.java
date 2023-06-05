package com.sist.animingle.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;
import com.sist.animingle.user.repository.UserDTO;

public class UserDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}
	
	
	public UserDTO login(UserDTO dto) {
		try {

			String sql = "select * from tblUser where user_id = ? and user_pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_id());
			pstat.setString(2, dto.getUser_pw());

			rs = pstat.executeQuery();

			if (rs.next()) {
				UserDTO result = new UserDTO();
				result.setUser_id(rs.getString("user_id"));
				result.setUser_nickname(rs.getString("user_nickname"));
				
				return result;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	
}
