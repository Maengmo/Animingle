package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class MedicalDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public static Connection mapconn;
	
	/*
	 * public MedicalDAO() { this.conn = DBUtil.open("3.38.234.229", "admin",
	 * "java1234"); }
	 */
	
	public List<HospitalDTO> hlist(String neLat, String neLng, String swLat, String swLng) {
		
		try {
			
			String sql = "select * from tblHospital where (h_lat between ? and ?) and (h_lng between ? and ?)";
			
			pstat = mapconn.prepareStatement(sql);
			pstat.setDouble(1, Double.parseDouble(swLat));
			pstat.setDouble(2, Double.parseDouble(neLat));
			pstat.setDouble(3, Double.parseDouble(swLng));
			pstat.setDouble(4, Double.parseDouble(neLng));
			
			rs = pstat.executeQuery();
			
			List<HospitalDTO> hlist = new ArrayList<HospitalDTO>();
			
			while (rs.next()) {
				
				HospitalDTO dto = new HospitalDTO();
				
				dto.setH_seq(rs.getString("h_seq"));
				dto.setH_name(rs.getString("h_name"));
				dto.setH_address(rs.getString("h_address"));
				dto.setH_ing(rs.getString("h_ing"));
				dto.setH_lat(rs.getString("h_lat"));
				dto.setH_lng(rs.getString("h_lng"));
				dto.setH_open(rs.getString("h_open"));
				dto.setH_close(rs.getString("h_close"));
				
				
				hlist.add(dto);
				
				
			}
			
			return hlist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
		
	}

	public List<PharmacyDTO> plist(String neLat, String neLng, String swLat, String swLng) {
		
		try {
			
			String sql = "select * from tblPharmacy where (p_lat between ? and ?) and (p_lng between ? and ?)";
			
			pstat = mapconn.prepareStatement(sql);
			pstat.setDouble(1, Double.parseDouble(swLat));
			pstat.setDouble(2, Double.parseDouble(neLat));
			pstat.setDouble(3, Double.parseDouble(swLng));
			pstat.setDouble(4, Double.parseDouble(neLng));
			
			rs = pstat.executeQuery();
			
			List<PharmacyDTO> plist = new ArrayList<PharmacyDTO>();
			
			while (rs.next()) {
				
				PharmacyDTO dto = new PharmacyDTO();
				
				dto.setP_seq(rs.getString("p_seq"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_address(rs.getString("p_address"));
				dto.setP_ing(rs.getString("p_ing"));
				dto.setP_lat(rs.getString("p_lat"));
				dto.setP_lng(rs.getString("p_lng"));
				dto.setP_open(rs.getString("p_open"));
				dto.setP_close(rs.getString("p_close"));
				
				
				plist.add(dto);
				
				
			}
			
			return plist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
		
	}

	public List<HReviewDTO> rlist(String h_seq) {
		
		try {
			
			String sql = "select * from tblHospital h left outer join tblHReview r on h.h_seq = r.h_seq left outer join tblUser u on u.user_id = r.hr_writer where h.h_seq = ?";
			
			pstat = mapconn.prepareStatement(sql);
			pstat.setString(1, h_seq);

			
			rs = pstat.executeQuery();
			
			List<HReviewDTO> rlist = new ArrayList<HReviewDTO>();
			
			while (rs.next()) {
				
				HReviewDTO dto = new HReviewDTO();
				
				dto.setH_seq(rs.getString("h_seq"));
				dto.setH_name(rs.getString("h_name"));
				dto.setH_address(rs.getString("h_address"));
				dto.setH_open(rs.getString("h_open"));
				dto.setH_close(rs.getString("h_close"));
				dto.setHr_tag1(rs.getString("hr_tag1"));
				dto.setHr_tag2(rs.getString("hr_tag2"));
				dto.setHr_tag3(rs.getString("hr_tag3"));
				dto.setHr_tag4(rs.getString("hr_tag4"));
				dto.setHr_writer(rs.getString("hr_writer"));
				dto.setHr_rate(rs.getString("hr_rate"));
				dto.setHr_content(rs.getString("hr_content"));
				dto.setHr_regdate(rs.getString("hr_regdate"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_pic(rs.getString("user_pic"));
				dto.setHr_regdate(rs.getString("hr_regdate"));
				
				rlist.add(dto);
				
				
			}
			
			return rlist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<HReviewCountDTO> hrclist(String hseq) {
		
		try {
			if (MedicalDAO.mapconn == null || MedicalDAO.mapconn.isClosed()) {
				
				MedicalDAO.mapconn = DBUtil.open("3.38.234.229", "admin", "java1234");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			
			String sql = String.format(
					"select \r\n"
					+ "    (select count(hr_tag1) from tblhreview where hr_tag1 = 'y' and h_seq = %s) as tag1c,\r\n"
					+ "    (select count(hr_tag2) from tblhreview where hr_tag2 = 'y' and h_seq = %s) as tag2c,\r\n"
					+ "    (select count(hr_tag3) from tblhreview where hr_tag3 = 'y' and h_seq = %s) as tag3c,\r\n"
					+ "    (select count(hr_tag4) from tblhreview where hr_tag4 = 'y' and h_seq = %s) as tag4c,\r\n"
					+ "    (select count(hr_tag5) from tblhreview where hr_tag4 = 'y' and h_seq = %s) as tag5c\r\n"
					+ "from tblhreview r\r\n"
					+ "    where h_seq = %s", hseq, hseq, hseq, hseq, hseq, hseq);
			
			System.out.println(sql);
			
			stat = MedicalDAO.mapconn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<HReviewCountDTO> hrclist = new ArrayList<HReviewCountDTO>();
			
			while (rs.next()) {
				
				HReviewCountDTO dto = new HReviewCountDTO();
				
				dto.setTag1c(rs.getString("tag1c"));
				dto.setTag2c(rs.getString("tag2c"));
				dto.setTag3c(rs.getString("tag3c"));
				dto.setTag4c(rs.getString("tag4c"));
				dto.setTag5c(rs.getString("tag5c"));
				
				hrclist.add(dto);
				
			}
			
			System.out.println("hrclist2 : " + hrclist.size());
			
			return hrclist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public List<PReviewDTO> plist(String p_seq) {
		
		try {
			
			String sql = "select * from tblPharmacy p left outer join tblPReview r on p.p_seq = r.p_seq left outer join tblUser u on u.user_id = r.pr_writer where p.p_seq = ?";
			
			pstat = mapconn.prepareStatement(sql);
			pstat.setString(1, p_seq);

			
			rs = pstat.executeQuery();
			
			List<PReviewDTO> plist = new ArrayList<PReviewDTO>();
			
			while (rs.next()) {
				
				PReviewDTO dto = new PReviewDTO();
				
				dto.setP_seq(rs.getString("p_seq"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_address(rs.getString("p_address"));
				dto.setP_open(rs.getString("p_open"));
				dto.setP_close(rs.getString("p_close"));
				dto.setPr_tag1(rs.getString("pr_tag1"));
				dto.setPr_tag2(rs.getString("pr_tag2"));
				dto.setPr_tag3(rs.getString("pr_tag3"));
				dto.setPr_tag4(rs.getString("pr_tag4"));
				dto.setPr_writer(rs.getString("pr_writer"));
				dto.setPr_rate(rs.getString("pr_rate"));
				dto.setPr_content(rs.getString("pr_content"));
				dto.setPr_regdate(rs.getString("pr_regdate"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_pic(rs.getString("user_pic"));
				dto.setPr_regdate(rs.getString("pr_regdate"));
				
				plist.add(dto);
				
				
			}
			
			return plist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public List<PReviewCountDTO> prclist(String pseq) {
		
		try {
			if (MedicalDAO.mapconn == null || MedicalDAO.mapconn.isClosed()) {
				
				MedicalDAO.mapconn = DBUtil.open("3.38.234.229", "admin", "java1234");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			
			String sql = String.format(
					"select \r\n"
					+ "    (select count(pr_tag1) from tblpreview where pr_tag1 = 'y' and p_seq = %s) as tag1c,\r\n"
					+ "    (select count(pr_tag2) from tblpreview where pr_tag2 = 'y' and p_seq = %s) as tag2c,\r\n"
					+ "    (select count(pr_tag3) from tblpreview where pr_tag3 = 'y' and p_seq = %s) as tag3c,\r\n"
					+ "    (select count(pr_tag4) from tblpreview where pr_tag4 = 'y' and p_seq = %s) as tag4c,\r\n"
					+ "    (select count(pr_tag5) from tblpreview where pr_tag5 = 'y' and p_seq = %s) as tag5c\r\n"
					+ "from tblpreview r\r\n"
					+ "    where p_seq = %s", pseq, pseq, pseq, pseq, pseq, pseq);
			
			System.out.println(sql);
			
			stat = MedicalDAO.mapconn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<PReviewCountDTO> prclist = new ArrayList<PReviewCountDTO>();
			
			while (rs.next()) {
				
				PReviewCountDTO dto = new PReviewCountDTO();
				
				dto.setTag1c(rs.getString("tag1c"));
				dto.setTag2c(rs.getString("tag2c"));
				dto.setTag3c(rs.getString("tag3c"));
				dto.setTag4c(rs.getString("tag4c"));
				dto.setTag5c(rs.getString("tag5c"));
				
				prclist.add(dto);
				
			}
			
			System.out.println("prclist2 : " + prclist.size());
			
			return prclist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int addPr(PReviewDTO dto) {
		
		try {
			
			String sql = "insert into tblPReview (pr_seq, pr_writer, pr_num, pr_rate, pr_content, pr_tag1, pr_tag2, pr_tag3, pr_tag4, pr_tag5, pr_regdate, pr_receipt, p_seq) \r\n"
					+ "    values(PR_SEQ.nextVal, ?, 3140000000000000000, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";

			pstat = MedicalDAO.mapconn.prepareStatement(sql);

			pstat.setString(1, dto.getPr_writer());
			pstat.setString(2, dto.getPr_rate());
			pstat.setString(3, dto.getPr_content());
			pstat.setString(4, dto.getPr_tag1());
			pstat.setString(5, dto.getPr_tag2());
			pstat.setString(6, dto.getPr_tag3());
			pstat.setString(7, dto.getPr_tag4());
			pstat.setString(8, dto.getPr_tag5());
			pstat.setString(9, dto.getPr_receipt());
			pstat.setString(10, dto.getP_seq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int addHr(HReviewDTO dto) {
		
		try {
			
			String sql = "insert into tblHReview (hr_seq, hr_writer, hr_num, hr_rate, hr_content, hr_tag1, hr_tag2, hr_tag3, hr_tag4, hr_tag5, hr_regdate, hr_receipt, h_seq) \r\n"
					+ "    values(HR_SEQ.nextVal, ?, 3140000000000000000, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";

			pstat = MedicalDAO.mapconn.prepareStatement(sql);

			pstat.setString(1, dto.getHr_writer());
			pstat.setString(2, dto.getHr_rate());
			pstat.setString(3, dto.getHr_content());
			pstat.setString(4, dto.getHr_tag1());
			pstat.setString(5, dto.getHr_tag2());
			pstat.setString(6, dto.getHr_tag3());
			pstat.setString(7, dto.getHr_tag4());
			pstat.setString(8, dto.getHr_tag5());
			pstat.setString(9, dto.getHr_receipt());
			pstat.setString(10, dto.getH_seq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	
	
}
