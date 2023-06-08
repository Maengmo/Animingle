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
			String sql = "select * from tblInquiry i inner join tblinanswer ina on i.in_seq = ina.in_seq where ina.in_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			List<InAnswerDTO> list = new ArrayList<InAnswerDTO>();
			
			while (rs.next()) {
				InAnswerDTO dto = new InAnswerDTO();
				
				dto.setIna_seq(rs.getString("ina_seq"));
				dto.setIn_seq(seq);
				dto.setIna_content(rs.getString("ina_content"));
				dto.setIna_regdate(rs.getString("ina_regdate"));
				dto.setA_id(rs.getString("a_id"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	//문의에 달린 답변 가져오기
	

}
