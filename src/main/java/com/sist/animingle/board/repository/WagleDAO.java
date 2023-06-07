package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.my.DBUtil;

public class WagleDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public WagleDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}

	public List<WagleDTO> list(HashMap<String, String> map) {

		List<WagleDTO> list = new ArrayList<WagleDTO>();

		try {
			
			String where = "";
			
			if (map.get("search").equals("y")) {
				where =  String.format("where wg_subject like '%%%s%%'"
										, map.get("searchtext"));
			}
			
			String sql = String.format("SELECT\r\n"
					+ "    wg_seq, wg_subject, wg_regdate, wg_writer, wg_readcount, wg_content, \r\n"
					+ "    (select user_nickname from tblUser where user_id = tblWagle.wg_writer) as wg_nickname,\r\n"
					+ "    CASE\r\n"
					+ "        WHEN wg_prefix = 1 THEN '일상'\r\n"
					+ "        WHEN wg_prefix = 2 THEN '정보공유'\r\n"
					+ "        ELSE '나눔'\r\n"
					+ "    END AS  wg_prefix,\r\n"
					+ "    (select count(*) from tblWagleComment where tblWagleComment.wg_seq = tblWagle.wg_seq) as wg_ccnt\r\n"
					+ "FROM tblWagle %s order by wg_regdate desc", where);


			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			while (rs.next()) {

				WagleDTO dto = new WagleDTO();

				dto.setWg_seq(rs.getInt("wg_seq"));
				dto.setWg_prefix(rs.getString("wg_prefix"));
				dto.setWg_subject(rs.getString("wg_subject"));
				dto.setWg_content(rs.getString("wg_content"));
				dto.setWg_regdate(rs.getString("wg_regdate"));
				dto.setWg_writer(rs.getString("wg_writer"));
				dto.setWg_readcount(rs.getInt("wg_readcount"));
				dto.setWg_nickname(rs.getString("wg_nickname"));
				dto.setWg_ccnt(Integer.parseInt(rs.getString("wg_ccnt")));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public WagleDTO getWagleCont(String seq) {
		
		try {
			
			String sql = "SELECT\r\n"
					+ "    wg_seq, wg_subject, wg_regdate, wg_writer, wg_readcount, wg_content, \r\n"
					+ "    (select user_nickname from tblUser where user_id = tblWagle.wg_writer) as wg_nickname,\r\n"
					+ "    CASE\r\n"
					+ "        WHEN wg_prefix = 1 THEN '일상'\r\n"
					+ "        WHEN wg_prefix = 2 THEN '정보공유'\r\n"
					+ "        ELSE '나눔'\r\n"
					+ "    END AS  wg_prefix\r\n"
					+ "FROM tblWagle where wg_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();
			
			if (rs.next()) {

				WagleDTO dto = new WagleDTO();

				dto.setWg_seq(rs.getInt("wg_seq"));
				dto.setWg_prefix(rs.getString("wg_prefix"));
				dto.setWg_subject(rs.getString("wg_subject"));
				dto.setWg_content(rs.getString("wg_content"));
				dto.setWg_regdate(rs.getString("wg_regdate"));
				dto.setWg_writer(rs.getString("wg_writer"));
				dto.setWg_readcount(rs.getInt("wg_readcount"));
				dto.setWg_nickname(rs.getString("wg_nickname"));
				

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<WagleCommentDTO> WagleClist(String seq) {
		
		
		List<WagleCommentDTO> clist = new ArrayList<WagleCommentDTO>();
		
		
		try {

			
			String sql = "select c.*, u.user_nickname\r\n"
					+ "from tblwagleComment c inner join tblwagle w on c.wg_seq = w.wg_seq \r\n"
					+ "                            inner join tblUser u on c.wgc_writer = u.user_id \r\n"
					+ "where w.wg_seq = ? order by wgc_regdate";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();
			
			while (rs.next()) {

				WagleCommentDTO cdto = new WagleCommentDTO();

				cdto.setWg_seq(rs.getInt("wg_seq"));
				cdto.setWgc_seq(rs.getInt("wgc_seq"));
				cdto.setWgc_writer(rs.getString("wgc_writer"));
				cdto.setWgc_regdate(rs.getString("wgc_regdate"));
				cdto.setWgc_content(rs.getString("wgc_content"));
				cdto.setWgc_nickname(rs.getString("user_nickname"));
				
				
				clist.add(cdto);

			}

			return clist;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return clist;
	}

	public String getWagleCcnt(String seq) {
	
		
		 try {
			  
			 String sql =
			 "select count(*) as ccnt from tblwagleComment c inner join tblwagle w on c.wg_seq = w.wg_seq where w.wg_seq = ?";
			  
			 pstat = conn.prepareStatement(sql); 
			 pstat.setString(1, seq);
			 rs = pstat.executeQuery();
			  
			 if (rs.next()) {
			  
			 return rs.getString("ccnt"); }
			  
			 } catch (Exception e) { 
				 e.printStackTrace(); 
			 }
			 
		
		return null;
	}

	public void readcountupdate(String seq) {
	
		try {

			String sql = "update tblwagle set wg_readcount = wg_readcount + 1 where wg_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int wagleedit(WagleDTO dto) {

		try {

			String sql = "update tblWagle set wg_prefix = ?, wg_subject = ?, wg_content = ? where wg_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getWg_prefix());
			pstat.setString(2, dto.getWg_subject());
			pstat.setString(3, dto.getWg_content());
			pstat.setString(4, dto.getWg_seq().toString());
			

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int addWagleComment(WagleCommentDTO cdto) {
		
		try {

			String sql = "insert into tblWagleComment values (wgc_seq.nextVal, ?, ?, sysdate, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, cdto.getWg_seq().toString());
			pstat.setString(2, cdto.getWgc_writer());
			pstat.setString(3, cdto.getWgc_content());			

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<WagleDTO> prefixlist(String prefix) {
		List<WagleDTO> list = new ArrayList<WagleDTO>();

		try {
			
			String sql = "SELECT\r\n"
					+ "    wg_seq, wg_subject, wg_regdate, wg_writer, wg_readcount, wg_content, \r\n"
					+ "    (select user_nickname from tblUser where user_id = tblWagle.wg_writer) as wg_nickname,\r\n"
					+ "    CASE\r\n"
					+ "        WHEN wg_prefix = 1 THEN '일상'\r\n"
					+ "        WHEN wg_prefix = 2 THEN '정보공유'\r\n"
					+ "        ELSE '나눔'\r\n"
					+ "    END AS  wg_prefix,\r\n"
					+ "    (select count(*) from tblWagleComment where tblWagleComment.wg_seq = tblWagle.wg_seq) as wg_ccnt\r\n"
					+ "FROM tblWagle where wg_prefix = ? order by wg_regdate desc";


			pstat = conn.prepareStatement(sql);

			pstat.setString(1, prefix);

			rs = pstat.executeQuery();

			while (rs.next()) {

				WagleDTO dto = new WagleDTO();

				dto.setWg_seq(rs.getInt("wg_seq"));
				dto.setWg_prefix(rs.getString("wg_prefix"));
				dto.setWg_subject(rs.getString("wg_subject"));
				dto.setWg_content(rs.getString("wg_content"));
				dto.setWg_regdate(rs.getString("wg_regdate"));
				dto.setWg_writer(rs.getString("wg_writer"));
				dto.setWg_readcount(rs.getInt("wg_readcount"));
				dto.setWg_nickname(rs.getString("wg_nickname"));
				dto.setWg_ccnt(Integer.parseInt(rs.getString("wg_ccnt")));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public int wagleDel(String seq) {
		
		try {

			String sql = "delete from tblWagle where wg_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delAllComment(String seq) {
		
		try {

			String sql = "delete from tblWagleComment where wg_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delComment(String wgc_seq) {
		
		try {

			String sql = "delete from tblwaglecomment where wgc_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, wgc_seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	
}
