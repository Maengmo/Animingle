package com.sist.animingle.board.medical;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.MedicalDAO;
import com.sist.animingle.board.repository.PharmacyDTO;
import com.test.my.DBUtil;

@WebServlet("/board/medicalPharmacy.do")
public class MedicalPharmacy extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MedicalPharmacy.java
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
		
		
		if ((neLat != null)&&(!neLat.equals(""))&&(select.equals("pharmacy"))) {
			
			List<PharmacyDTO> hlist = dao.plist(neLat, neLng, swLat, swLng);		//장소
		
		//List<PharmacyDTO> plist = dao.plist();  //카테고리
		
		//req.setAttribute("hlist", hlist);
		//req.setAttribute("plist", plist);
		
		
			resp.setCharacterEncoding("UTF-8");
			JSONArray arr3 = new JSONArray();
			
			for (PharmacyDTO dto:hlist) {
				JSONObject obj3 = new JSONObject();
				
				obj3.put("p_lat", dto.getP_lat());
				obj3.put("p_lng", dto.getP_lng());
				obj3.put("p_name", dto.getP_name());
				obj3.put("p_address", dto.getP_address());
				obj3.put("p_ing",dto.getP_ing());
				obj3.put("p_seq", dto.getP_seq());
				arr3.add(obj3);
			}
			//JSON 구문
			
			PrintWriter writer = resp.getWriter();
			
			resp.setContentType("application/json");
			writer.print(arr3);
			writer.close();
			
		}
		
		
		
		//System.out.println(neLat);
	}

}
