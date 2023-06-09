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
	
	public WalkTogetherDAO() {
		conn = DBUtil.open("3.38.234.229", "admin", "java1234");
		//conn = DBUtil.open("localhost", "admin", "java1234");
	}

	public boolean checkWriting(String seq) {
		
		try {
			
			String sql = "select count(*) as cnt from tblWalkTogether where wt_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			String cnt = "";
			if(rs.next()) {
				cnt = rs.getString("cnt");
			}
			
			if(!cnt.equals("0")) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
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
	

	public List<WalkTogetherDTO> getWriting() {

		List<WalkTogetherDTO> ilist = new ArrayList<WalkTogetherDTO>();
		
		try {
						
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
			
			return ilist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ilist;
	}

	public List<List<String>> getPath(String swLat, String swLng, String neLat, String neLng) {
		
		List<List<String>> plist = new ArrayList<List<String>>();
		
		try {
						
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
			
			return plist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return plist;
	}

	public void updateState(String wt_seq) {
		
		try {
						
			String sql = "update tblWalktogether set wt_ing = 'N' where wt_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, wt_seq);
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void deleteWriting(String wt_seq) {
		
		try {

			String sql = "delete from tblWalkTogether where wt_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, wt_seq);
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public String getContent(String seq) {
		
		String content ="";
		
		try {
			
			String sql = "select wt_content from tblWalkTogether where wt_seq = ?";
			
			pstat= conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				content = rs.getString("wt_content");
			}
			
			return content;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return content;
	}

	public void editContent(WalkTogetherDTO dto) {
		
		try {
			
			String sql = "update tblWalkTogether set wt_subject = ?, wt_petkind = ?, wt_time = ?, wt_content = ? where wt_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getWt_subject());
			pstat.setString(2, dto.getWt_petkind());
			pstat.setString(3, dto.getWt_time());
			pstat.setString(4, dto.getWt_content());
			pstat.setString(5, dto.getWt_seq());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void delPath(String seq) {
		
		try {
			
			String sql = "delete from tblWTPath where wt_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void editPath(List<WTPathDTO> addPathDTO) {
		
		try {
			
			String sql = "";
			
			for (WTPathDTO dto : addPathDTO) {
				
				sql = "insert into tblWTPath (wtp_seq, wt_seq, wtp_lat, wtp_lng, wtp_order) values (wtp_seq.nextVal, ?, ?, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getWt_seq());
				pstat.setString(2, dto.getWtp_lat());
				pstat.setString(3, dto.getWtp_lng());
				pstat.setInt(4, dto.getWtp_order());
				
				pstat.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
