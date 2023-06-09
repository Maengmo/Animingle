package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class CommunityListDAO {
	

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public CommunityListDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}

	public List<VetQnAListDTO> comqnalist() {
		
		List<VetQnAListDTO> list = new ArrayList<VetQnAListDTO>();
		
		try {
			

			String sql = "select * from (select i.*, rownum r from (SELECT\r\n"
					+ "		         		 vq_seq, vq_subject, vq_regdate, vq_writer, vq_readcount,\r\n"
					+ "		         		CASE\r\n"
					+ "		         		     WHEN vq_prefix = 1 THEN '강아지'\r\n"
					+ "		         		    WHEN vq_prefix = 2 THEN '고양이'\r\n"
					+ "		         		     ELSE '기타'\r\n"
					+ "		         	  END AS  vq_prefix,\r\n"
					+ "		         		   (select count(*) from tblvqreply where tblvqreply.vq_seq = tblvetqna.vq_seq) as answer_cnt\r\n"
					+ "                    FROM tblvetqna order by vq_regdate desc) i) where r between 1 and 4";
			
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			

			while (rs.next()) {

				VetQnAListDTO dto = new VetQnAListDTO();

				dto.setVq_seq(rs.getString("vq_seq"));
				dto.setVq_subject(rs.getString("vq_subject"));
				dto.setVq_prefix(rs.getString("vq_prefix"));
				dto.setVq_regdate(rs.getDate("vq_regdate"));
				dto.setVq_readcount(rs.getString("vq_readcount"));
				dto.setAnswer_cnt(rs.getString("answer_cnt"));
				dto.setVq_writer(rs.getString("vq_writer"));
				
				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
