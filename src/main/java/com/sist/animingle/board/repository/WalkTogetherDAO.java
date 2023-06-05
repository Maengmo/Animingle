package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import com.test.my.DBUtil;

public class WalkTogetherDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public WalkTogetherDAO() {
	    this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}
	
	public int addContent(WalkTogetherDTO dto1) {
		
		try {
			
			String sql = "insert into tblWalkTogether (wt_seq, wt_writer, wt_subject, wt_petkind, wt_time, wt_content, wt_regdate) values (wt_seq.nextVal, ?, ?, ?, ?, ?, sysdate)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto1.getId());
			pstat.setString(2, dto1.getWt_subject());
			pstat.setString(3, dto1.getWt_petkind());
			pstat.setString(4, dto1.getWt_time());
			pstat.setString(5, dto1.getWt_content());
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getWtSeq() {

		int wt_seq = 0;
		
		try {

			String sql = "select max(wt_seq) as seq from tblWalkTogether";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				wt_seq = rs.getInt("seq");
			}

			return wt_seq;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return wt_seq;
	}

	public int addPath(List<WTPathDTO> pathList) {
		
		try {
			
			String sql = "";
			
			for (WTPathDTO dto : pathList) {
				
				sql = "insert into tblWTPath (wtp_seq, wt_seq, wtp_lat, wtp_lng, wtp_order) values (wtp_seq.nextVal, ?, ?, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getWt_seq());
				pstat.setString(2, dto.getWtp_lat());
				pstat.setString(3, dto.getWtp_lng());
				pstat.setInt(4, dto.getWtp_order());
				
				pstat.executeUpdate();
			}
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}
