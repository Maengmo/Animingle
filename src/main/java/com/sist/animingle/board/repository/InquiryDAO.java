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
			String sql = "select i.*, u.user_nickname as nickname  from tblInquiry  i inner join tbluser u on i.in_writer = u.user_id where i.in_prefix  = ? order by in_regdate desc";
			
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
				dto.setNickname(rs.getString("nickname"));
				
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

			String sql = "select i.*, u.user_nickname as nickname from tblInquiry i inner join tbluser u on i.in_writer = u.user_id where in_seq = ?";

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
				dto.setNickname(rs.getString("nickname"));
				
				String regdate = rs.getString("in_regdate").substring(0,10);
				dto.setIn_regdate(regdate);
				
				

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	//문의 내역 갯수
	public int getInquiryCount_1() {
		try {

			String sql = "select count(*) as cnt from tblinquiry where in_prefix = 1";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	//신고 내역 갯수
	public int getInquiryCount_2() {
		try {

			String sql = "select count(*) as cnt from tblinquiry where in_prefix = 2";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	//문의 완료 갯수
	public int getAnswerCount_1() {
		try {

			String sql = "select count(*) as cnt from (select i.in_seq, count(ina.ina_content)\r\n"
					+ "from tblinquiry i\r\n"
					+ "left outer join tblinanswer ina on i.in_seq = ina.in_seq\r\n"
					+ "where i.in_prefix = 1\r\n"
					+ "group by i.in_seq\r\n"
					+ "having count(ina.ina_content) > 0)";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getAnswerCount_2() {
		try {

			String sql = "select count(*) as cnt from (select i.in_seq, count(ina.ina_content)\r\n"
					+ "from tblinquiry i\r\n"
					+ "left outer join tblinanswer ina on i.in_seq = ina.in_seq\r\n"
					+ "where i.in_prefix = 2\r\n"
					+ "group by i.in_seq\r\n"
					+ "having count(ina.ina_content) > 0)";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
}
