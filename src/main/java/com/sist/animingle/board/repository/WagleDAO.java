package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			
			String currentPage = map.get("currentPage");
			String itemsPerPage = map.get("itemsPerPage");
			
			
			 if (map.get("search").equals("y")) { 
				 where = String.format("where wg_subject like '%%%s%%'" , map.get("searchtext")); 
				 }
			 
			
			 String sql = String.format("select * from (select i.*, rownum r from (SELECT\r\n"
		         		+ "    wg_seq, wg_subject, wg_regdate, wg_writer, wg_readcount, wg_content, \r\n"
		         		+ "    (select user_nickname from tblUser where user_id = tblWagle.wg_writer) as wg_nickname,\r\n"
		         		+ "    (select user_pic from tblUser where user_id = tblWagle.wg_writer) as user_pic,\r\n"
		         		+ "    CASE\r\n"
		         		+ "        WHEN wg_prefix = 1 THEN '일상'\r\n"
		         		+ "        WHEN wg_prefix = 2 THEN '정보공유'\r\n"
		         		+ "        ELSE '나눔'\r\n"
		         		+ "    END AS  wg_prefix,\r\n"
		         		+ "    (select count(*) from tblWagleComment where tblWagleComment.wg_seq = tblWagle.wg_seq) as wg_ccnt\r\n"
		         		+ "FROM tblWagle %s order by wg_regdate desc) i) where r between ? and ?", where);

			    int offset = (Integer.parseInt(currentPage) - 1) * Integer.parseInt(itemsPerPage);
		         
		         pstat = conn.prepareStatement(sql);
		         pstat.setInt(1, offset + 1);
		         pstat.setInt(2, offset + Integer.parseInt(itemsPerPage));
		         
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
				dto.setUser_pic(rs.getString("user_pic"));

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
	         		+ "    (select user_pic from tblUser where user_id = tblWagle.wg_writer) as user_pic,\r\n"
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
				dto.setUser_pic(rs.getString("user_pic"));
				

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

			
			String sql = "select c.*, u.user_nickname, u.user_pic\r\n"
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
				cdto.setUser_pic(rs.getString("user_pic"));
				
				
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

	public List<WagleDTO> prefixlist(HashMap<String, String> map) {
		List<WagleDTO> list = new ArrayList<WagleDTO>();

		try {
			
			/*
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
			*/
			
			
			String where = "";
			
			String currentPage = map.get("currentPage");
			String itemsPerPage = map.get("itemsPerPage");
			String prefix =  map.get("prefix");
			
			/*
			if (map.get("prefix") == null) {
				prefix = "";
			} else {
				prefix = map.get("prefix");
			}
			*/
			
			 if (map.get("search").equals("y")) { 
				 where = String.format("and wg_subject like '%%%s%%'" , map.get("searchtext")); 
				 }
			 
			
			 String sql = String.format("select * from (select i.*, rownum r from (SELECT\r\n"
		         		+ "    wg_seq, wg_subject, wg_regdate, wg_writer, wg_readcount, wg_content, \r\n"
		         		+ "    (select user_nickname from tblUser where user_id = tblWagle.wg_writer) as wg_nickname,\r\n"
		         		+ "    (select user_pic from tblUser where user_id = tblWagle.wg_writer) as user_pic,\r\n"
		         		+ "    CASE\r\n"
		         		+ "        WHEN wg_prefix = 1 THEN '일상'\r\n"
		         		+ "        WHEN wg_prefix = 2 THEN '정보공유'\r\n"
		         		+ "        ELSE '나눔'\r\n"
		         		+ "    END AS  wg_prefix,\r\n"
		         		+ "    (select count(*) from tblWagleComment where tblWagleComment.wg_seq = tblWagle.wg_seq) as wg_ccnt\r\n"
		         		+ "FROM tblWagle where wg_prefix=%s %s order by wg_regdate desc) i) where r between ? and ?\r\n", prefix, where);

			    int offset = (Integer.parseInt(currentPage) - 1) * Integer.parseInt(itemsPerPage);
		         
		         pstat = conn.prepareStatement(sql);
		         pstat.setInt(1, offset + 1);
		         pstat.setInt(2, offset + Integer.parseInt(itemsPerPage));
		         
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
				dto.setUser_pic(rs.getString("user_pic"));

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

	public int getTotalDataCount() {
		
	    int page = 0;

        try {

           String sql = "select count(wg_seq) as total from tblwagle";
           
            stat = conn.createStatement();

            rs = stat.executeQuery(sql);

            while (rs.next()) {
                page = rs.getInt("total");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return page;

	}

	public List<WagleDTO> getBoardContent(int currentPage, int itemsPerPage) {
		
		List<WagleDTO> list = new ArrayList<WagleDTO>();
		   
	      try {
	         
	         String sql = "select * from (select i.*, rownum r from (SELECT\r\n"
	         		+ "    wg_seq, wg_subject, wg_regdate, wg_writer, wg_readcount, wg_content, \r\n"
	         		+ "    (select user_nickname from tblUser where user_id = tblWagle.wg_writer) as wg_nickname,\r\n"
	         		+ "    (select user_pic from tblUser where user_id = tblWagle.wg_writer) as user_pic,\r\n"
	         		+ "    CASE\r\n"
	         		+ "        WHEN wg_prefix = 1 THEN '일상'\r\n"
	         		+ "        WHEN wg_prefix = 2 THEN '정보공유'\r\n"
	         		+ "        ELSE '나눔'\r\n"
	         		+ "    END AS  wg_prefix,\r\n"
	         		+ "    (select count(*) from tblWagleComment where tblWagleComment.wg_seq = tblWagle.wg_seq) as wg_ccnt\r\n"
	         		+ "FROM tblWagle order by wg_regdate desc) i) where r between ? and ?";
	         
	         int offset = (currentPage - 1) * itemsPerPage;
	         
	         pstat = conn.prepareStatement(sql);
	         pstat.setInt(1, offset + 1);
	         pstat.setInt(2, offset + itemsPerPage);
	         
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
				 dto.setUser_pic(rs.getString("user_pic"));
				 
	            
	            list.add(dto);
	            
	         }
	         
	         rs.close();
	         pstat.close();
	         conn.close();
	         
	         return list;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return null;
	}

	public List<WagleDTO> comwaglelist() {
		List<WagleDTO> list = new ArrayList<WagleDTO>();
		
		try {
			

			String sql = "select * from (select i.*, rownum r from (SELECT\r\n"
					+ "		         		 wg_seq, wg_subject, wg_regdate, wg_writer, wg_readcount, wg_content,\r\n"
					+ "		         		(select user_nickname from tblUser where user_id = tblWagle.wg_writer) as wg_nickname,\r\n"
	         		+ "    (select user_pic from tblUser where user_id = tblWagle.wg_writer) as user_pic,\r\n"
					+ "		         		CASE\r\n"
					+ "		         		     WHEN wg_prefix = 1 THEN '일상'\r\n"
					+ "		         		    WHEN wg_prefix = 2 THEN '정보공유'\r\n"
					+ "		         		     ELSE '나눔'\r\n"
					+ "		         	  END AS  wg_prefix,\r\n"
					+ "		         		   (select count(*) from tblWagleComment where tblWagleComment.wg_seq = tblWagle.wg_seq) as wg_ccnt\r\n"
					+ "                    FROM tblWagle order by wg_regdate desc) i) where r between 1 and 4";
			
			
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
				dto.setUser_pic(rs.getString("user_pic"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public HashMap<String, String> getuserpic(String id) {
		
		
		HashMap<String, String> map = new HashMap<String,String>();
		
		  try {
		         
		         String sql = "select user_pic from tblUser where user_id = ?";
		         

		         
		         pstat = conn.prepareStatement(sql);
		         pstat.setString(1, id);
		         
		         rs = pstat.executeQuery();
		         
		         if (rs.next()) {
		        	 
		            
		           map.put("userpic", rs.getString("user_pic"));
					 

		         }
		         
		         rs.close();
		         pstat.close();
		         conn.close();
		         
		         return map;
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      
		      return null;
	}

	public int wagleAdd(WagleDTO dto) {
		
		try {
			
			String sql = "insert into tblWagle "
					+ "(wg_seq, wg_writer, wg_prefix, wg_subject, wg_content, wg_regdate, wg_readcount) "
					+ "values (wg_seq.nextVal, ?, ?, ?, ?, sysdate, 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getWg_writer());
			pstat.setString(2, dto.getWg_prefix());
			pstat.setString(3, dto.getWg_subject());
			pstat.setString(4, dto.getWg_content());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<WagleDTO> indexList() {
		
		try {
			
			List<WagleDTO> wlist = new ArrayList<WagleDTO>();
			
			String sql = "select w.wg_seq as wg_seq,\r\n"
					+ "			case w.wg_prefix\r\n"
					+ "			when 1 then '일상'\r\n"
					+ "			when 2 then '정보공유'\r\n"
					+ "			when 3 then '나눔'\r\n"
					+ "			end as wg_prefix,\r\n"
					+ "			w.wg_subject, to_char(w.wg_regdate, 'yyyy-mm-dd') as wg_regdate, w.wg_readcount,\r\n"
					+ "			u.user_id, u.user_nickname, u.user_pic,\r\n"
					+ "			(select count(*) from tblWagleComment wc where wc.wg_seq = w.wg_seq) as wg_ccnt\r\n"
					+ "			from tblWagle w \r\n"
					+ "			inner join tblUser u \r\n"
					+ "			on w.wg_writer = u.user_id \r\n"
					+ "			order by wg_regdate desc";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			int num = 0;
			
			while (rs.next() && num < 5) {
				
				num++;
				
				WagleDTO dto = new WagleDTO();
				
				dto.setWg_seq(rs.getInt("wg_seq"));
				dto.setWg_prefix(rs.getString("wg_prefix"));
				dto.setWg_subject(rs.getString("wg_subject"));
				dto.setWg_regdate(rs.getString("wg_regdate"));
				dto.setWg_writer(rs.getString("user_id"));
				dto.setWg_nickname(rs.getString("user_nickname"));
				dto.setUser_pic(rs.getString("user_pic"));
				dto.setWg_readcount(rs.getInt("wg_readcount"));
				dto.setWg_ccnt(rs.getInt("wg_ccnt"));
				
				wlist.add(dto);
			}
			
			return wlist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	
}
