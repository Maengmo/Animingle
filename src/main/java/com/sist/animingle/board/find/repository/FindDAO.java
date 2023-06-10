package com.sist.animingle.board.find.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.my.DBUtil;

public class FindDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public FindDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}

	public int findadd(FindDTO dto) {
		
		try {

			String sql = "insert into tblfindfamily (ff_seq, ff_writer, ff_prefix, ff_subject, ff_content, ff_lat, ff_lng, ff_regdate) values (ff_seq.nextVal, ?, ?, ?, ?, ?, ?, sysdate)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getWriter());
			pstat.setInt(2, dto.getPrefix());
			pstat.setString(3, dto.getSubject());
			pstat.setString(4, dto.getContent());
			pstat.setDouble(5, dto.getLat());
			pstat.setDouble(6, dto.getLng());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<FindDTO> list(HashMap<String, String> map) {
		
		List<FindDTO> list = new ArrayList<FindDTO>(); 
		
		try {
			
			String where = "";
			
			if ((map.get("prefix").equals("1") || map.get("prefix").equals("2")) && map.get("search").equals("y")) {
			
				where = String.format(" where ff_prefix = %s and ff_subject like '%%%s%%'", map.get("prefix"), map.get("word"));
			} else if ((map.get("prefix").equals("1") || map.get("prefix").equals("2")) && map.get("search").equals("n")) {
				where = String.format(" where ff_prefix = %s", map.get("prefix"));
			} else if (map.get("prefix").equals("0") && map.get("search").equals("y")) {
				where = String.format(" where ff_subject like '%%%s%%'", map.get("word"));
			} else if (map.get("prefix").equals("0") && map.get("search").equals("n")) {
				where = "";
			}
			
			String sql = String.format("select * from (select ff.*, rownum as rnum from (select (select user_nickname from tblUser where user_id = ff_writer) as nickname, (select count(*) from tblffcomment where ff_seq = f.ff_seq) as ffc_cnt, ff_seq, ff_writer, to_char(ff_regdate, 'YYYY-MM-DD') as ff_regdate, ff_prefix, ff_subject, ff_readcount from tblFindFamily f %s order by ff_seq desc) ff)"
					+ " where rnum between %s and %s order by ff_seq desc", where, map.get("begin"), map.get("end"));
			
			
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			 
			
			while (rs.next()) {
				
				FindDTO dto = new FindDTO();
				
				dto.setSeq(rs.getString("ff_seq"));
				dto.setNickname(rs.getString("nickname"));
				dto.setWriter(rs.getString("ff_writer"));
				dto.setRegdate(rs.getString("ff_regdate"));
				dto.setPrefix(rs.getInt("ff_prefix"));
				dto.setSubject(rs.getString("ff_subject"));
				dto.setReadcount(rs.getInt("ff_readcount"));
				dto.setFfc_cnt(rs.getInt("ffc_cnt"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public FindDTO get(String seq) {
		
		try {

			String sql = "select (select user_nickname from tblUser where user_id = ff_writer) as nickname, (select count(*) from tblffcomment where ff_seq = f.ff_seq) as cnt, f.* from tblFindFamily f where ff_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				FindDTO dto = new FindDTO();

				dto.setSeq(rs.getString("ff_seq"));
				dto.setNickname(rs.getString("nickname"));
				dto.setWriter(rs.getString("ff_writer"));
				dto.setPrefix(rs.getInt("ff_prefix"));
				dto.setSubject(rs.getString("ff_subject"));
				dto.setContent(rs.getString("ff_content"));
				dto.setReadcount(rs.getInt("ff_readcount"));
				dto.setLat(rs.getDouble("ff_lat"));
				dto.setLng(rs.getDouble("ff_lng"));
				dto.setFfc_cnt(rs.getInt("cnt"));
				
				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<FindCDTO> getComment(String seq) {
		
		try {
			
			String sql = "select (select user_nickname from tblUser where user_id = ffc_writer) as nickname, ffc_content, to_char(ffc_regdate, 'YYYY-MM-DD') as ffc_regdate, ffc_writer, ffc_seq from tblffcomment where ff_seq = ? order by ffc_seq";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			List<FindCDTO> list = new ArrayList<FindCDTO>();  
			
			while (rs.next()) {
				
				FindCDTO cdto = new FindCDTO();
				
				cdto.setNickname(rs.getString("nickname"));
				cdto.setWriter(rs.getString("ffc_writer"));
				cdto.setContent(rs.getString("ffc_content"));
				cdto.setRegdate(rs.getString("ffc_regdate"));
				cdto.setFfc_seq(rs.getString("ffc_seq"));
				
				list.add(cdto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int findCommentAdd(FindCDTO dto) {
		
		try {

			String sql = "insert into tblFFComment (ffc_seq, ff_seq, ffc_writer, ffc_content, ffc_regdate) values (ffc_seq.nextVal, ?, ?, ?, sysdate)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getFf_seq());
			pstat.setString(2, dto.getWriter());
			pstat.setString(3, dto.getContent());


			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public void updateReadCount(String seq) {
		
		try {

			String sql = "update tblFindFamily set ff_readcount = ff_readcount + 1 where ff_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public FindCDTO getLastComment(String seq) {
		
		try {

			String sql = "select (select user_nickname from tblUser where user_id = ffc_writer) as nickname, (select count(*) from tblffcomment where ff_seq = ?) as ffc_cnt, to_char(ffc_regdate, 'YYYY-MM-DD') as ffc_regdate, f.* from tblffcomment f where ffc_seq = (select max(ffc_seq) from tblffcomment where ff_seq = ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);
			pstat.setString(2, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				FindCDTO dto = new FindCDTO();
				
				
				dto.setNickname(rs.getString("nickname"));
				dto.setWriter(rs.getString("ffc_writer"));
				dto.setContent(rs.getString("ffc_content"));
				dto.setRegdate(rs.getString("ffc_regdate"));
				dto.setFfc_cnt(rs.getString("ffc_cnt"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int getTotalCount() {
		
		try {

			String sql = "select count(*) as cnt from tblFindFamily";

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

	public int findDelComment(String seq) {
		
		try {

			String sql = "delete tblffcomment where ff_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int findDel(String seq) {
		
		try {

			String sql = "delete tblfindfamily where ff_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int findedit(FindDTO dto) {
		
		try {

			String sql = "update tblFindFamily set ff_subject = ?, ff_content = ?, ff_prefix = ?, ff_lat = ?, ff_lng = ? where ff_seq = ?";

			pstat = conn.prepareStatement(sql);
			
			
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setInt(3, dto.getPrefix());
			pstat.setDouble(4, dto.getLat());
			pstat.setDouble(5, dto.getLng());
			pstat.setString(6, dto.getSeq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int findCPositionAdd(FindCDTO cdto) {
		
		try {

			String sql = "insert into tblCposition values (cp_seq.nextVal, (select max(ffc_seq) from tblffcomment), ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, cdto.getClat());
			pstat.setString(2, cdto.getClng());
			

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public FindCDTO getCP(FindCDTO cdto) {
		
		try {

			String sql = "select cp_lat, cp_lng from tblcposition where ffc_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, cdto.getFfc_seq());

			rs = pstat.executeQuery();
			
			if (rs.next()) {

				cdto.setClat(rs.getString("cp_lat"));
				cdto.setClng(rs.getString("cp_lng"));
			
				return cdto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int findDelCPosition(String seq) {
		
		
		try {

			String sql = "delete tblcposition where ffc_seq in (select ffc_seq from tblffcomment where ff_seq = ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
}
