package com.sist.animingle.board.medical;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.HospitalDTO;
import com.sist.animingle.board.repository.MedicalDAO;
import com.test.my.DBUtil;

@WebServlet("/board/medicalHospital.do")
public class MedicalHospital extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MedicalHospital.java
		//medical.java
		MedicalDAO dao = new MedicalDAO();

		//좌표값을 읽어오는 구문
		String neLat = req.getParameter("neLat");
		String neLng = req.getParameter("neLng");
		String swLat = req.getParameter("swLat");
		String swLng = req.getParameter("swLng");
		String select = req.getParameter("select");
		
		//System.out.println(select);
		
		//addside를 이용해서 안에 내용물들을 가져오는 구문
		String h_seq = req.getParameter("seq");
		
		// 위도 경도 
		if ((neLat != null)&&(!neLat.equals(""))&&(select.equals("hospital"))) {
			
			List<HospitalDTO> hlist = dao.hlist(neLat, neLng, swLat, swLng);		//장소
		
		//List<PharmacyDTO> plist = dao.plist();  //카테고리
		
		//req.setAttribute("hlist", hlist);
		//req.setAttribute("plist", plist);
		
		
			resp.setCharacterEncoding("UTF-8");
			JSONArray arr = new JSONArray();
			
			for (HospitalDTO dto:hlist) {
				JSONObject obj = new JSONObject();
				
				obj.put("h_lat", dto.getH_lat());
				obj.put("h_lng", dto.getH_lng());
				obj.put("h_name", dto.getH_name());
				obj.put("h_address", dto.getH_address());
				obj.put("h_ing",dto.getH_ing());
				obj.put("h_seq", dto.getH_seq());
				arr.add(obj);
			}
			//JSON 구문
			
			PrintWriter writer = resp.getWriter();
			
			resp.setContentType("application/json");
			writer.print(arr);
			writer.close();
			
		} 
		
	}

}
