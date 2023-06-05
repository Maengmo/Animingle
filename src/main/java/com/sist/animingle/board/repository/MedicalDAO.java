package com.sist.animingle.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class MedicalDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MedicalDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}

	public List<HospitalDTO> hlist(String neLat, String neLng, String swLat, String swLng) {
		
		try {
			
			String sql = "select * from tblHospital where (h_lat between ? and ?) and (h_lng between ? and ?)";
			
			pstat = conn.prepareStatement(sql);
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

	public List<PharmacyDTO> plist() {
		
		try {
			
			String sql = "select * from tblPharmacy";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<PharmacyDTO> plist = new ArrayList<PharmacyDTO>();
			
			while (rs.next()) {
				
				PharmacyDTO dto = new PharmacyDTO();
				
				dto.setP_seq(rs.getString("p_name"));
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

	
	
	
	
}
