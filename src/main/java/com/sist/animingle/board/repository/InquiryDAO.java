package com.sist.animingle.board.repository;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
	
	
	//관리자 - 문의 현황 불러오기
	public List<InquiryDTO> inquiryList(String prefix) {
		
		
		try {
			String sql = "select * from tblInquiry where in_prefix  = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, prefix);
			
			rs = pstat.executeQuery();
			
			List<InquiryDTO> list = new ArrayList<InquiryDTO>();
			
			while (rs.next()) {
				InquiryDTO dto = new InquiryDTO();
				
				dto.setIn_seq(rs.getString("in_seq"));
				dto.setIn_writer(rs.getString("in_writer"));
				dto.setIn_subject(rs.getString("in_subject"));
				dto.setIn_prefix(rs.getString("in_prefix"));
				dto.setIn_content(rs.getString("in_content"));
				dto.setIn_regdate(rs.getString("in_regdate").substring(0, 10));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	//관리자 - seq에 해당하는 문의 현황 불러오기
	public InquiryDTO inquiryView(String seq) {
		
		try {

			String sql = "select * from tblInquiry where in_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {
				InquiryDTO dto = new InquiryDTO();
				
				dto.setIn_seq(seq);
				dto.setIn_writer(rs.getString("in_writer"));
				dto.setIn_subject(rs.getString("in_subject"));
				dto.setIn_prefix(rs.getString("in_prefix"));
				dto.setIn_content(rs.getString("in_content"));
				dto.setIn_regdate(rs.getString("in_regdate"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
}
