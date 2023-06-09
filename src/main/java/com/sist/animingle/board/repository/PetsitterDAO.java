package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class PetsitterDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public PetsitterDAO() {
		String server = "3.38.234.229";
		String id = "admin";
		String pw = "java1234";
		
		this.conn = DBUtil.open(server, id, pw);
	}

	public int getPetTotalDataCount() {
		
		int page = 0;

        try {

        	String sql = "select count(psr_seq) as total from tblPSRecruitment";
        	
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

	public List<PetsitterDTO> getPetBoardContent(int currentPage, int itemsPerPage) {
		
		List<PetsitterDTO> list = new ArrayList<PetsitterDTO>();
		
		try {
			
			String sql = "SELECT *\r\n"
					+ "FROM (\r\n"
					+ "  SELECT i.*, rownum r\r\n"
					+ "  FROM (\r\n"
					+ "    SELECT *\r\n"
					+ "    FROM tblpsrecruitment p\r\n"
					+ "    INNER JOIN tbluser u\r\n"
					+ "    ON p.psr_writer = u.user_id\r\n"
					+ "    ORDER BY psr_seq DESC\r\n"
					+ "  ) i\r\n"
					+ ")\r\n"
					+ "WHERE r BETWEEN ? AND ?";
			
			int offset = (currentPage - 1) * itemsPerPage;
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, offset + 1);
			pstat.setInt(2, offset + itemsPerPage);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				PetsitterDTO dto = new PetsitterDTO();
				
				dto.setPsr_seq(rs.getString("psr_seq"));
				dto.setPsr_writer(rs.getString("psr_writer"));
				dto.setPsr_subject(rs.getString("psr_subject"));
				dto.setPsr_content(rs.getString("psr_content"));
				dto.setPsr_fromdate(rs.getDate("psr_fromdate"));
				dto.setPsr_todate(rs.getDate("psr_todate"));
				dto.setPsr_region(rs.getString("psr_region"));
				dto.setPsr_state(rs.getString("psr_state"));
				dto.setPsr_regdate(rs.getDate("psr_regdate"));
				dto.setPsr_readcount(rs.getString("psr_readcount"));
				
				dto.setUser_nickname(rs.getString("user_nickname"));
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

	public PetsitterViewDTO petView(String psr_seq) {
		
		try {
			
			String sql = "select \r\n"
					+ "    *\r\n"
					+ "from tblpsrecruitment p\r\n"
					+ "    inner join tbluser u\r\n"
					+ "        on p.psr_writer = u.user_id\r\n"
					+ "where psr_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, psr_seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				PetsitterViewDTO dto = new PetsitterViewDTO();
				
				dto.setPsr_seq(rs.getString("psr_seq"));
				dto.setPsr_writer(rs.getString("psr_writer"));
				dto.setPsr_subject(rs.getString("psr_subject"));
				dto.setPsr_content(rs.getString("psr_content"));
				dto.setPsr_fromdate(rs.getDate("psr_fromdate"));
				dto.setPsr_todate(rs.getDate("psr_todate"));
				dto.setPsr_region(rs.getString("psr_region"));
				dto.setPsr_state(rs.getString("psr_state"));
				dto.setPsr_regdate(rs.getDate("psr_regdate"));
				dto.setPsr_readcount(rs.getString("psr_readcount"));
				
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_pic(rs.getString("user_pic"));
				
				return dto;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<PetsitterViewDTO> petLog(String psr_seq) {
		
		List<PetsitterViewDTO> plist = new ArrayList<PetsitterViewDTO>();
		
		try {
			
			String sql = " select \r\n"
					+ "    a.psa_seq as psa_seq,\r\n"
					+ "    a.ps_id as ps_id,\r\n"
					+ "    a.psa_adoptdate as psa_adoptdate,\r\n"
					+ "    p.ps_pic as ps_pic,\r\n"
					+ "    p.ps_intro as ps_intro,\r\n"
					+ "    r.psr_writer as psr_writer,\r\n"
					+ "    ( select count(*) as ps_matchcount \r\n"
					+ "        from tblPetsitter ps\r\n"
					+ "            inner join tblPSApply psa\r\n"
					+ "                on ps.ps_id = psa.ps_id\r\n"
					+ "            inner join tblPSLog psl\r\n"
					+ "                on psa.psa_seq = psl.psa_seq\r\n"
					+ "                    where p.ps_id = psa.ps_id) as ps_cnt,\r\n"
					+ "    ( select  \r\n"
					+ "            round(nvl(avg(psl.pslog_rate), 0),1)\r\n"
					+ "        from tblPetsitter ps\r\n"
					+ "            inner join tblPSApply psa\r\n"
					+ "                on ps.ps_id = psa.ps_id\r\n"
					+ "            inner join tblPSLog psl\r\n"
					+ "                on psa.psa_seq = psl.psa_seq\r\n"
					+ "        where p.ps_id = psa.ps_id) as rate,\r\n"
					+ "    ( select \r\n"
					+ "            user_nickname\r\n"
					+ "        from tbluser\r\n"
					+ "        where user_id = p.ps_id) user_nickname\r\n"
					+ "from tblpsapply a\r\n"
					+ "    inner join tblpsrecruitment r\r\n"
					+ "        on r.psr_seq = a.psr_seq\r\n"
					+ "    inner join tbluser u\r\n"
					+ "        on r.psr_writer = u.user_id\r\n"
					+ "    inner join tblpetsitter p\r\n"
					+ "        on a.ps_id = p.ps_id\r\n"
					+ " where a.psr_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, psr_seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				PetsitterViewDTO dto = new PetsitterViewDTO();
				
				dto.setPsa_seq(rs.getString("psa_seq"));
				dto.setPs_id(rs.getString("ps_id"));
				dto.setPsa_adoptdate(rs.getString("psa_adoptdate"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_pic(rs.getString("ps_pic"));
				dto.setPs_intro(rs.getString("ps_intro"));
				dto.setPsr_writer(rs.getString("psr_writer"));
				dto.setPs_cnt(rs.getString("ps_cnt"));
				dto.setRate(rs.getString("rate"));
				
				plist.add(dto);
				
			}
			
			rs.close();
			pstat.close();
			conn.close();
			
			return plist;
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int petRecruitmentDel(String psr_seq) {
		
		try {
			
			String sql = "delete from tblpsrecruitment where psr_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, psr_seq);
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int petRecruitmentAdd(PetsitterAddDTO dto) {
		
		try {
			
			String sql = "insert \r\n"
					+ "    into tblpsrecruitment \r\n"
					+ "        (psr_seq\r\n"
					+ "        , psr_writer\r\n"
					+ "        , psr_subject\r\n"
					+ "        , psr_content\r\n"
					+ "        , psr_fromdate\r\n"
					+ "        , psr_todate\r\n"
					+ "        , psr_region\r\n"
					+ "        , psr_state\r\n"
					+ "        , psr_regdate\r\n"
					+ "        , psr_readcount)\r\n"
					+ "    values (psr_seq.nextVal\r\n"
					+ "    , ?\r\n"
					+ "    , ?\r\n"
					+ "    , ?\r\n"
					+ "    , ?\r\n"
					+ "    , ?\r\n"
					+ "    , ?\r\n"
					+ "    , '모집중'\r\n"
					+ "    , sysdate\r\n"
					+ "    , 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPsr_writer());
			pstat.setString(2, dto.getPsr_subject());
			pstat.setString(3, dto.getPsr_content());
			pstat.setString(4, dto.getPsr_fromdate());
			pstat.setString(5, dto.getPsr_todate());
			pstat.setString(6, dto.getPsr_region());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public PetsitterEditDTO getEditData(String psr_seq) {
		
		try {
			
			String sql = "select \r\n"
					+ "    psr_writer,\r\n"
					+ "    psr_subject,\r\n"
					+ "    psr_content,\r\n"
					+ "    psr_fromdate,\r\n"
					+ "    psr_todate,\r\n"
					+ "    psr_region\r\n"
					+ "from tblpsrecruitment\r\n"
					+ "    where psr_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, psr_seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				PetsitterEditDTO dto = new PetsitterEditDTO();
				
				dto.setPsr_writer(rs.getString("psr_writer"));
				dto.setPsr_subject(rs.getString("psr_subject"));
				dto.setPsr_content(rs.getString("psr_content"));
				dto.setPsr_fromdate(rs.getDate("psr_fromdate"));
				dto.setPsr_todate(rs.getDate("psr_todate"));
				dto.setPsr_region(rs.getString("psr_region"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int petRecruitmentEdit(String psr_seq, PetsitterAddDTO dto) {
		
		try {
			
			String sql = "update tblpsrecruitment set\r\n"
					+ "    psr_subject = ?,\r\n"
					+ "    psr_region = ?,\r\n"
					+ "    psr_fromdate = ?,\r\n"
					+ "    psr_todate = ?,\r\n"
					+ "    psr_content = ?\r\n"
					+ "where psr_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPsr_subject());
			pstat.setString(2, dto.getPsr_region());
			pstat.setString(3, dto.getPsr_fromdate());
			pstat.setString(4, dto.getPsr_todate());
			pstat.setString(5, dto.getPsr_content());
			pstat.setString(6, psr_seq);
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int petApply(PetsitterApplyDTO dto) {
		
		try {
			
			String sql = "insert \r\n"
					+ "    into tblpsapply (psa_seq, ps_id, psr_seq, psa_applydate, psa_adoptdate)    \r\n"
					+ "values (psa_seq.nextVal, ?, ?, sysdate, null)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPs_id());
			pstat.setString(2, dto.getPsr_seq());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<PetsitterApplyDTO> checkDuplication(String psr_seq) {
		
		List<PetsitterApplyDTO> dlist = new ArrayList<PetsitterApplyDTO>();
		
		try {
			
			String sql = "select \r\n"
					+ "    a.ps_id\r\n"
					+ "from tblpsapply a\r\n"
					+ "    inner join tblpsrecruitment p\r\n"
					+ "        on a.psr_seq = p.psr_seq\r\n"
					+ "where p.psr_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, psr_seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				PetsitterApplyDTO dto = new PetsitterApplyDTO();
				dto.setPs_id(rs.getString("ps_id"));
				
				dlist.add(dto);
				
			}
			
			rs.close();
			pstat.close();
			conn.close();
			
			return dlist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int adoptdateUpdate(String psa_seq) {
		
		try {
			
			String sql = "update tblpsapply set psa_adoptdate = sysdate\r\n"
					+ " where psa_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, psa_seq);
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int recruitmentUpdate(String psr_seq) {
		
		try {
			
			String sql = "update tblpsrecruitment set psr_state = '모집완료'\r\n"
					+ "    where psr_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, psr_seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}
