package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.test.my.DBUtil;

public class InquiryDAO {
	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;

	public InquiryDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}
	
	//문의 내역 추가
	public int addInquiry(InquiryDTO dto) {
		
		try {

			String sql = "insert into tblInquiry (in_seq, in_writer, in_subject, in_prefix, in_content, in_regdate) values (in_seq.nextVal, ?, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getIn_writer());
			pstat.setString(2, dto.getIn_subject());
			pstat.setString(3, dto.getIn_prefix());
			pstat.setString(4, dto.getIn_content());
			pstat.setString(5, dto.getIn_regdate());

			return pstat.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	
	}
	
	
}
