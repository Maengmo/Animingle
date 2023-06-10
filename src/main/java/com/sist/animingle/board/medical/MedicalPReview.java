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

import com.sist.animingle.board.repository.HReviewDTO;
import com.sist.animingle.board.repository.MedicalDAO;
import com.sist.animingle.board.repository.PReviewCountDTO;
import com.sist.animingle.board.repository.PReviewDTO;

@WebServlet("/board/medicalPReview.do")
public class MedicalPReview extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MedicalPReview.java
		
		MedicalDAO dao = new MedicalDAO();

		
		String p_seq = req.getParameter("seq");
		
		//System.out.println(select);
		List<PReviewCountDTO> Prclist = dao.prclist(p_seq);
		
		JSONArray arr1 = new JSONArray();
		
		for (PReviewCountDTO dto : Prclist) {
			JSONObject obj1 = new JSONObject();
			
			obj1.put("tag1c", dto.getTag1c());
			obj1.put("tag2c", dto.getTag2c());
			obj1.put("tag3c", dto.getTag3c());
			obj1.put("tag4c", dto.getTag4c());
			obj1.put("tag5c", dto.getTag5c());
			
			arr1.add(obj1);
			
		}
		
		
		//req.setAttribute("hrclist", hrclist);
		
		//addside를 이용해서 안에 내용물들을 가져오는 구문
		
		//System.out.println(h_seq);
		
		JSONObject obj = new JSONObject();
		
		if ((p_seq != null)&&(!p_seq.equals(""))) {
			
			List<PReviewDTO> plist = dao.plist(p_seq);

			resp.setCharacterEncoding("UTF-8");
			JSONArray arr2 = new JSONArray();
			
			for (PReviewDTO dto:plist) {
				JSONObject obj2 = new JSONObject();
				
				obj2.put("p_name", dto.getP_name());
				obj2.put("p_address", dto.getP_address());
				obj2.put("p_open", dto.getP_open());
				obj2.put("p_close", dto.getP_close());
				obj2.put("pr_tag1", dto.getPr_tag1());
				obj2.put("pr_tag2", dto.getPr_tag2());
				obj2.put("pr_tag3", dto.getPr_tag3());
				obj2.put("pr_tag4", dto.getPr_tag4());
				obj2.put("pr_tag5", dto.getPr_tag5());
				obj2.put("pr_writer", dto.getPr_writer());
				obj2.put("pr_rate", dto.getPr_rate());
				obj2.put("pr_content", dto.getPr_content());
				obj2.put("user_nickname", dto.getUser_nickname());
				obj2.put("user_pic", dto.getUser_pic());
				obj2.put("pr_regdate", dto.getPr_regdate());
				
				arr2.add(obj2);
			}
			//JSON 구문

			
			obj.put("arr1", arr1);
			obj.put("arr2", arr2);
			
			PrintWriter writer = resp.getWriter();
			
			resp.setContentType("application/json");
			writer.print(obj);
			writer.close();
			
		} 
		
		
	}

}
