package com.sist.animingle.board.repository;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class InAnswerDAO {
	
	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;

	public InAnswerDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}

	//문의글 번호에 해당하는 답변 가져오기
	public List<InAnswerDTO> inAnswerList(String seq) {
		
		try {
			String sql = "select * from tblInquiry i \r\n"
					+ "inner join tblinanswer ina on i.in_seq = ina.in_seq \r\n"
					+ "inner join tbluser u on i.in_writer = u.user_id \r\n"
					+ "inner join tbladmin a on ina.a_id = a.a_id\r\n"
					+ "where ina.in_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			List<InAnswerDTO> list = new ArrayList<InAnswerDTO>();
			
			while (rs.next()) {
				InAnswerDTO dto = new InAnswerDTO();
				
				dto.setIna_seq(rs.getString("ina_seq"));
				dto.setIn_seq(seq);
				
				String content = rs.getString("ina_content").replace("\n", "<br>");
				dto.setIna_content(content);
				
				
				String regdate = rs.getString("in_regdate").substring(0,10);
				dto.setIna_regdate(regdate);
				dto.setA_id(rs.getString("a_id"));
				dto.setA_nickname(rs.getString("a_nickname"));
				dto.setU_nickname(rs.getString("user_nickname"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	
	//문의에 답변 달기
	public int addAnswer(InAnswerDTO dto) {
		try {

			String sql = "insert into tblInanswer values (ina_seq.nextVal, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getIn_seq());
			pstat.setString(2, dto.getIna_content());
			pstat.setString(3, dto.getIna_regdate());
			pstat.setString(4, dto.getA_id());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	//방금 등록한 답변 불러오기
	public InAnswerDTO getAnswer(String seq) {
		
		try {

			String sql = "select ina.ina_content as content, ina.a_id as id, ina.ina_regdate as regdate, a.a_nickname as nickname\r\n"
					+ "from tblInquiry i \r\n"
					+ "inner join tblinanswer ina on i.in_seq = ina.in_seq \r\n"
					+ "inner join tblAdmin a on a.a_id = ina.a_id\r\n"
					+ "where ina.in_seq = ? and  ina.ina_seq = (select max(ina_seq) from tblinanswer where in_seq = ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();

			if (rs.next()) {
				InAnswerDTO dto = new InAnswerDTO();
				
				dto.setA_id(rs.getString("id"));
				dto.setIna_content(rs.getString("content"));
				
				String regdate = rs.getString("regdate").substring(0,10);
				dto.setIna_regdate(regdate);
				dto.setA_nickname(rs.getString("nickname"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
