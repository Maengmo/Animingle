package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class VetQnADAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public VetQnADAO() {
		String server = "3.38.234.229";
		String id = "admin";
		String pw = "java1234";
		
		this.conn = DBUtil.open(server, id, pw);
	}

	public List<VetQnAListDTO> list() {
		
		List<VetQnAListDTO> list = new ArrayList<VetQnAListDTO>();
		
		try {
			
			String sql = "select distinct\r\n"
					+ "    q.vq_seq as vq_seq,\r\n"
					+ "    q.vq_writer as vq_writer,\r\n"
					+ "    q.vq_subject as vq_subject,\r\n"
					+ "    q.vq_prefix as vq_prefix,\r\n"
					+ "    q.vq_content as vq_content,\r\n"
					+ "    q.vq_regdate as vq_regdate,\r\n"
					+ "    q.vq_readcount as vq_readcount,\r\n"
					+ "    (select count(*) from tblvqreply where vq_seq = r.vq_seq) as answer_cnt\r\n"
					+ "from tblvetqna q\r\n"
					+ "    left outer join tblvqreply r\r\n"
					+ "     on q.vq_seq = r.vq_seq\r\n"
					+ "order by vq_seq desc";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				
				VetQnAListDTO dto = new VetQnAListDTO();
				
				dto.setVq_seq(rs.getString("vq_seq"));
				dto.setVq_writer(rs.getString("vq_writer"));
				dto.setVq_subject(rs.getString("vq_subject"));
				dto.setVq_prefix(rs.getString("vq_prefix"));
				dto.setVq_content(rs.getString("vq_content"));
				dto.setVq_regdate(rs.getDate("vq_regdate"));
				dto.setVq_readcount(rs.getString("vq_readcount"));
				dto.setAnswer_cnt(rs.getString("answer_cnt"));
				
				list.add(dto);
				
			}
			
			rs.close();
			stat.close();
			conn.close();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public VetQnAViewDTO viewList(String seq) {
		
		try {
			
			String sql = "select\r\n"
					+ "	u.user_nickname as user_nickname,\r\n"
					+ "	u.user_id as user_id,\r\n"
					+ "    u.user_pic as user_pic,\r\n"
					+ "	l.vq_subject as vq_subject,\r\n"
					+ "	l.vq_content as vq_content,\r\n"
					+ "	l.vq_regdate as vq_regdate,\r\n"
					+ "	l.vq_readcount as vq_readcount,\r\n"
					+ "    l.vq_prefix as vq_prefix,\r\n"
					+ "    (select count(*) from tblvqreply where vq_seq = l.vq_seq) as vqr_cnt\r\n"
					+ "from tbluser u\r\n"
					+ "	inner join tblvetqna l\r\n"
					+ "	on u.user_id = l.vq_writer\r\n"
					+ "where l.vq_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				VetQnAViewDTO dto = new VetQnAViewDTO();
				
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pic(rs.getString("user_pic"));
				dto.setVq_subject(rs.getString("vq_subject"));
				dto.setVq_content(rs.getString("vq_content"));
				dto.setVq_regdate(rs.getDate("vq_regdate"));
				dto.setVq_readcount(rs.getString("vq_readcount"));
				dto.setVqr_cnt(rs.getString("vqr_cnt"));
				dto.setVq_prefix(rs.getString("vq_prefix"));
				
				return dto;			
			}
			
			rs.close();
			pstat.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<VetQnAViewDTO> answerList(String seq) {
		
		List<VetQnAViewDTO> alist = new ArrayList<VetQnAViewDTO>();
		
		try {
			
			String sql = "select\r\n"
					+ "    r.vqr_seq as vqr_seq,\r\n"
					+ "	r.vqr_regdate as vqr_regdate,\r\n"
					+ "	r.vqr_content as vqr_content,\r\n"
					+ "	e.vet_clinic as vet_clinic,\r\n"
					+ "	e.vet_seq as vet_seq,\r\n"
					+ "	u.user_nickname as user_nickname,\r\n"
					+ "    u.user_pic as user_pic,\r\n"
					+ "    (select count(*) from tblvqreply where vet_seq = e.vet_seq) as answer_cnt,\r\n"
					+ "    (select count(*) from tblvqrcomment where vqr_seq = r.vqr_seq) as comment_cnt\r\n"
					+ "from tblvqreply r\r\n"
					+ "	inner join tblveterinarian e\r\n"
					+ "		on r.vet_seq = e.vet_seq\r\n"
					+ "	inner join tbluser u\r\n"
					+ "		on e.vet_seq = u.user_id\r\n"
					+ "where vq_seq = ?\r\n"
					+ "    order by r.vqr_regdate asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				VetQnAViewDTO dto = new VetQnAViewDTO();
				
				dto.setVqr_seq(rs.getString("vqr_seq"));
				dto.setVqr_regdate(rs.getDate("vqr_regdate"));
				dto.setVqr_content(rs.getString("vqr_content"));
				dto.setVet_clinic(rs.getString("vet_clinic"));
				dto.setVet_seq(rs.getString("vet_seq"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_pic(rs.getString("user_pic"));
				dto.setAnswer_cnt(rs.getString("answer_cnt"));
				dto.setComment_cnt(rs.getString("comment_cnt"));
				
				alist.add(dto);
			}
			
			rs.close();
			pstat.close();
			conn.close();
			
			return alist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<VetQnAViewDTO> commentList(String seq) {
		
		List<VetQnAViewDTO> clist = new ArrayList<VetQnAViewDTO>();
		
		try {
			
			String sql = "select \r\n"
					+ "    r.vqr_seq as vqr_seq,\r\n"
					+ "    e.vet_seq as vet_seq,\r\n"
					+ "    c.vqrc_writer as vqrc_writer,\r\n"
					+ "    c.vqrc_content as vqrc_content,\r\n"
					+ "    c.vqrc_regdate as vqrc_regdate\r\n"
					+ "from tblvqreply r\r\n"
					+ "    inner join tblveterinarian e\r\n"
					+ "        on r.vet_seq = e.vet_seq\r\n"
					+ "    inner join tbluser u\r\n"
					+ "        on e.vet_seq = u.user_id\r\n"
					+ "    inner join tblvqrcomment c\r\n"
					+ "        on r.vqr_seq = c.vqr_seq\r\n"
					+ "where vq_seq = ?\r\n"
					+ "    order by c.vqrc_regdate asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				VetQnAViewDTO dto = new VetQnAViewDTO();
				
				dto.setVqr_seq(rs.getString("vqr_seq"));
				dto.setVet_seq(rs.getString("vet_seq"));
				dto.setVqrc_writer(rs.getString("vqrc_writer"));
				dto.setVqrc_content(rs.getString("vqrc_content"));
				dto.setVqrc_regdate(rs.getDate("vqrc_regdate"));
				
				clist.add(dto);
				
			}
			
			rs.close();
			pstat.close();
			conn.close();
			
			return clist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int qnaAdd(VetQnAAddDTO dto) {
		
		try {
			
			String sql = "insert \r\n"
					+ "    into tblvetqna \r\n"
					+ "    (vq_seq, vq_writer, vq_subject, vq_prefix, vq_content, vq_regdate, vq_readcount) \r\n"
					+ "values (vq_seq.nextVal, ?, ?, ?, ?, sysdate, 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getVq_writer());
			pstat.setString(2, dto.getVq_subject());
			pstat.setString(3, dto.getVq_prefix());
			pstat.setString(4, dto.getVq_content());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}

	public int qnaAnswerAdd(VetQnAAnswerDTO dto) {
		
		try {
			
			String sql = "insert\r\n"
					+ "    into tblvqreply\r\n"
					+ "    (vqr_seq, vq_seq, vet_seq, vqr_regdate, vqr_content) \r\n"
					+ "values (vqr_seq.nextVal, ?, ?, sysdate, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getVq_seq());
			pstat.setString(2, dto.getVet_seq());
			pstat.setString(3, dto.getVqr_content());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int qnaCommentAdd(VetQnACommentDTO dto) {
		
		try {
			
			String sql = "insert\r\n"
					+ "    into tblvqrcomment\r\n"
					+ "    (vqrc_seq, vqr_seq, vqrc_writer, vqrc_content, vqrc_regdate)\r\n"
					+ "values (vqrc_seq.nextVal, ?, ?, ?, sysdate)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getVqr_seq());
			pstat.setString(2, dto.getVqrc_writer());
			pstat.setString(3, dto.getVqrc_content());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public VetQnAViewDTO getComment(String vqr_seq) {
		
		try {
			
			String sql = "select\r\n"
					+ "    u.user_pic as user_pic,\r\n"
					+ "    c.vqr_seq as vqr_seq,\r\n"
					+ "    c.vqrc_writer as vqrc_writer,\r\n"
					+ "    c.vqrc_regdate as vqrc_regdate,\r\n"
					+ "    c.vqrc_content as vqrc_content,\r\n"
					+ "    (select count(*) from tblvqrcomment where vqr_seq = r.vqr_seq) as comment_cnt\r\n"
					+ "from tbluser u\r\n"
					+ "    inner join tblvqrcomment c\r\n"
					+ "        on u.user_id = vqrc_writer\r\n"
					+ "    inner join tblvqreply r\r\n"
					+ "        on c.vqr_seq = r.vqr_seq\r\n"
					+ "where c.vqr_seq = ?\r\n"
					+ "    order by vqrc_regdate desc";
					
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, vqr_seq);
			
			rs = pstat.executeQuery();
			
			VetQnAViewDTO dto = new VetQnAViewDTO();
			
			if (rs.next()) {
				
				dto.setUser_pic(rs.getString("user_pic"));
				dto.setVqr_seq(rs.getString("vqr_seq"));
				dto.setVqrc_writer(rs.getString("vqrc_writer"));
				dto.setVqrc_regdate(rs.getDate("vqrc_regdate"));
				dto.setVqrc_content(rs.getString("vqrc_content"));
				dto.setComment_cnt(rs.getString("comment_cnt"));
				
			}
			
			return dto; 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int qnaDel(String vq_seq) {
		
		try {
			
			String sql = "delete from tblvetqna where vq_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, vq_seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int vetQnAEdit(VetQnAViewDTO dto) {
		
		try {
			
			String sql = "update tblvetqna set\r\n"
					+ "    vq_subject = ?,\r\n"
					+ "    vq_prefix = ?,\r\n"
					+ "    vq_content = ?\r\n"
					+ "where vq_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getVq_subject());
			pstat.setString(2, dto.getVq_prefix());
			pstat.setString(3, dto.getVq_content());
			pstat.setString(4, dto.getVq_seq());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public void updateReadcount(String seq) {
		
		try {
			
			String sql = "update tblvetqna set vq_readcount = vq_readcount + 1 where vq_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int getVetTotalDataCount() {
		
		int page = 0;

        try {

        	String sql = "select count(vq_seq) as total from tblvetqna";
        	
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

	public List<VetQnAListDTO> getVetBoardContent(int currentPage, int itemsPerPage) {
		
		List<VetQnAListDTO> list = new ArrayList<VetQnAListDTO>();
		
		try {
			
			String sql = "SELECT i.*, \r\n"
					+ "       (SELECT COUNT(*) FROM tblvqreply WHERE vq_seq = i.vq_seq) AS answer_cnt\r\n"
					+ "FROM (\r\n"
					+ "  SELECT t.*, rownum r\r\n"
					+ "  FROM (\r\n"
					+ "    SELECT *\r\n"
					+ "    FROM tblvetqna\r\n"
					+ "    ORDER BY vq_seq DESC\r\n"
					+ "  ) t\r\n"
					+ ") i\r\n"
					+ "WHERE r BETWEEN ? AND ?";
			
			int offset = (currentPage - 1) * itemsPerPage;
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, offset + 1);
			pstat.setInt(2, offset + itemsPerPage);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				VetQnAListDTO dto = new VetQnAListDTO();
				
				dto.setVq_seq(rs.getString("vq_seq"));
				dto.setVq_writer(rs.getString("vq_writer"));
				dto.setVq_subject(rs.getString("vq_subject"));
				dto.setVq_prefix(rs.getString("vq_prefix"));
				dto.setVq_content(rs.getString("vq_content"));
				dto.setVq_regdate(rs.getDate("vq_regdate"));
				dto.setVq_readcount(rs.getString("vq_readcount"));
				
				dto.setAnswer_cnt(rs.getString("answer_cnt"));
				
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

	public List<VetQnAListDTO> getCommentCnt() {
		
		try {
			
			String sql = "select distinct\r\n"
					+ "    q.vq_seq as vq_seq,\r\n"
					+ "    (select count(*) from tblvqreply where vq_seq = r.vq_seq) as answer_cnt\r\n"
					+ "from tblvetqna q\r\n"
					+ "    left outer join tblvqreply r\r\n"
					+ "     on q.vq_seq = r.vq_seq\r\n"
					+ "order by vq_seq desc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<VetQnAListDTO> clist = new ArrayList<VetQnAListDTO>();
			
			while (rs.next()) {
				
				VetQnAListDTO dto = new VetQnAListDTO();
				dto.setVq_seq(rs.getString("vq_seq"));
				dto.setAnswer_cnt(rs.getString("answer_cnt"));
				
				clist.add(dto);
				
			}
			
			rs.close();
			stat.close();
			conn.close();
			
			return clist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<VetQnAListDTO> indexList() {
		
			try {
			
			List<VetQnAListDTO> vlist = new ArrayList<VetQnAListDTO>();
			
			String sql = "select v.vq_seq as vq_seq,\r\n"
					+ "case v.vq_prefix\r\n"
					+ "when 1 then '강아지'\r\n"
					+ "when 2 then '고양이'\r\n"
					+ "when 3 then '기타'\r\n"
					+ "end as vq_prefix,\r\n"
					+ "v.vq_subject, to_char(v.vq_regdate, 'yyyy-mm-dd') as vq_regdate, v.vq_readcount,\r\n"
					+ "u.user_id, u.user_nickname, u.user_pic,\r\n"
					+ "(select count(*) from tblVQReply vr where vr.vq_seq = v.vq_seq) as answer_cnt\r\n"
					+ "from tblVetQnA v \r\n"
					+ "inner join tblUser u \r\n"
					+ "on v.vq_writer = u.user_id \r\n"
					+ "order by vq_regdate desc";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			int num = 0;
			
			while (rs.next() && num < 5) {
				
				num++;
				
				VetQnAListDTO dto = new VetQnAListDTO();
				
				dto.setVq_seq(rs.getString("vq_seq"));
				dto.setVq_prefix(rs.getString("vq_prefix"));
				dto.setVq_subject(rs.getString("vq_subject"));
				dto.setVq_regdate(rs.getDate("vq_regdate"));
				dto.setVq_writer(rs.getString("user_id"));
				dto.setVq_nickname(rs.getString("user_nickname"));
				dto.setVq_pic(rs.getString("user_pic"));
				dto.setVq_readcount(rs.getString("vq_readcount"));
				dto.setAnswer_cnt(rs.getString("answer_cnt"));
				
				vlist.add(dto);
			}
			
			return vlist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

}
