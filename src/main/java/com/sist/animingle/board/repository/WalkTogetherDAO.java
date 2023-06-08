package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class WalkTogetherDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public int addContent(WalkTogetherDTO dto1) {
		
		try {
			
			//conn = DBUtil.open("localhost", "admin", "java1234");
			conn = DBUtil.open("3.38.234.229", "admin", "java1234");
			
			String sql = "insert into tblWalkTogether (wt_seq, wt_writer, wt_subject, wt_petkind, wt_time, wt_content, wt_regdate) values (wt_seq.nextVal, ?, ?, ?, ?, ?, sysdate)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto1.getId());
			pstat.setString(2, dto1.getWt_subject());
			pstat.setString(3, dto1.getWt_petkind());
			pstat.setString(4, dto1.getWt_time());
			pstat.setString(5, dto1.getWt_content());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getWtSeq() {

		int wt_seq = 0;
		
		try {
			
			//conn = DBUtil.open("localhost", "admin", "java1234");
			conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select max(wt_seq) as seq from tblWalkTogether";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				wt_seq = rs.getInt("seq");
				
			}
			
			rs.close();
			stat.close();
			conn.close();
			
			return wt_seq;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return wt_seq;
	}

	public int addPath(List<WTPathDTO> pathList) {
		
		try {
			
			//conn = DBUtil.open("localhost", "admin", "java1234");
			conn = DBUtil.open("3.38.234.229", "admin", "java1234");
			
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
			
			pstat.close();
			conn.close();
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	

	public List<WalkTogetherDTO> getWriting() {

		List<WalkTogetherDTO> ilist = new ArrayList<WalkTogetherDTO>();
		
		try {
			
			//conn = DBUtil.open("localhost", "admin", "java1234");
			conn = DBUtil.open("3.38.234.229", "admin", "java1234");
			
			String sql = "select wt_seq, wt_subject, wt_writer, wt_petkind, wt_time, wt_content from tblWalkTogether where wt_ing != 'N'";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				
				WalkTogetherDTO dto = new WalkTogetherDTO();
				
				dto.setWt_seq(rs.getString("wt_seq"));
				dto.setWt_subject(rs.getString("wt_subject"));
				dto.setWt_writer(rs.getString("wt_writer"));
				dto.setWt_petkind(rs.getString("wt_petkind"));
				dto.setWt_time(rs.getString("wt_time"));
				dto.setWt_content(rs.getString("wt_content"));
				
				ilist.add(dto);
				
			}
			
			rs.close();
			stat.close();
			conn.close();
			
			return ilist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ilist;
	}

	public List<List<String>> getPath(String swLat, String swLng, String neLat, String neLng) {
		
		List<List<String>> plist = new ArrayList<List<String>>();
		
		try {
			
			//conn = DBUtil.open("localhost", "admin", "java1234");
			conn = DBUtil.open("3.38.234.229", "admin", "java1234");
			
			String sql = "select wt_seq, wtp_lat, wtp_lng, wtp_order from tblWTPath where (wtp_lat between ? and ?) and (wtp_lng between ? and ?) and wt_seq not in (select wt_seq from tblWalkTogether where wt_ing = 'N')";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, swLat);
			pstat.setString(2, neLat);
			pstat.setString(3, swLng);
			pstat.setString(4, neLng);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				List<String> tmp = new ArrayList<String>();
				
				tmp.add(rs.getString("wt_seq"));
				tmp.add(rs.getString("wtp_order"));
				tmp.add(rs.getString("wtp_lat"));
				tmp.add(rs.getString("wtp_lng"));
				
				plist.add(tmp);
				
			}
			
			rs.close();
			pstat.close();
			conn.close();
			
			return plist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return plist;
	}

	public void updateState(String wt_seq) {
		
		try {
			
			//conn = DBUtil.open("localhost", "admin", "java1234");
			conn = DBUtil.open("3.38.234.229", "admin", "java1234");
			
			String sql = "update tblWalktogether set wt_ing = 'N' where wt_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, wt_seq);
			pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void deleteWriting(String wt_seq) {
		
		try {

			//conn = DBUtil.open("localhost", "admin", "java1234");
			conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "delete from tblWalkTogether where wt_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, wt_seq);
			pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public String getContent(String seq) {
		
		String content ="";
		
		try {

			//conn = DBUtil.open("localhost", "admin", "java1234");
			conn = DBUtil.open("3.38.234.229", "admin", "java1234");
			
			String sql = "select wt_content from tblWalkTogether where wt_seq = ?";
			
			pstat= conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				content = rs.getString("wt_content");
			}
			
			rs.close();
			pstat.close();
			conn.close();
			
			return content;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return content;
	}

}
