package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;
import com.test.toy.board.repository.BoardDTO;

public class InquiryDAO {
	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;

	public InquiryDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}
	
	public int addInquiry(InquiryDTO dto) {
		
		try {

			String sql = "sql";

			pstat = conn.prepareStatement(sql);
			//pstat.setString(1, value);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
