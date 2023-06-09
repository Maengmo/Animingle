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

import com.sist.animingle.board.repository.HReviewCountDTO;
import com.sist.animingle.board.repository.HReviewDTO;
import com.sist.animingle.board.repository.MedicalDAO;
import com.sist.animingle.board.repository.PReviewDTO;

@WebServlet("/board/medicalHReview.do")
public class MedicalHReview extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MedicalHReview.java
		//medical.java
		MedicalDAO dao = new MedicalDAO();

		
		String h_seq = req.getParameter("seq");
		
		//System.out.println(select);
		List<HReviewCountDTO> hrclist = dao.hrclist(h_seq);
		
		JSONArray arr1 = new JSONArray();
		
		for (HReviewCountDTO dto : hrclist) {
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
		
		if ((h_seq != null)&&(!h_seq.equals(""))) {
			
			List<HReviewDTO> rlist = dao.rlist(h_seq);

			resp.setCharacterEncoding("UTF-8");
			JSONArray arr2 = new JSONArray();
			
			for (HReviewDTO dto:rlist) {
				JSONObject obj2 = new JSONObject();
				
				obj2.put("h_name", dto.getH_name());
				obj2.put("h_address", dto.getH_address());
				obj2.put("h_open", dto.getH_open());
				obj2.put("h_close", dto.getH_close());
				obj2.put("hr_tag1", dto.getHr_tag1());
				obj2.put("hr_tag2", dto.getHr_tag2());
				obj2.put("hr_tag3", dto.getHr_tag3());
				obj2.put("hr_tag4", dto.getHr_tag4());
				obj2.put("hr_tag5", dto.getHr_tag5());
				obj2.put("hr_writer", dto.getHr_writer());
				obj2.put("hr_rate", dto.getHr_rate());
				obj2.put("hr_content", dto.getHr_content());
				obj2.put("user_nickname", dto.getUser_nickname());
				obj2.put("user_pic", dto.getUser_pic());
				obj2.put("hr_regdate", dto.getHr_regdate());
				
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
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
		
        // 폼 데이터에서 가져온 값
        String selectedTags = req.getParameter("selectedTags");
        String reviewText = req.getParameter("reviewText");
        String fileName = req.getParameter("fileName");
        String rating = req.getParameter("rating");
        String hseq = req.getParameter("seq");
        
        System.out.println(selectedTags);
        System.out.println(hseq);

        // 여기서 데이터베이스에 데이터를 삽입하는 로직을 구현하면 됩니다.
        HReviewDTO dto = new HReviewDTO();
		dto.setHr_content(reviewText);
		dto.setHr_receipt(fileName);
		dto.setHr_rate(rating);
		dto.setH_seq(hseq);
		if(selectedTags.equals("TAG1")) {
			dto.setHr_tag1("y");
			dto.setHr_tag2("n");
			dto.setHr_tag3("n");
			dto.setHr_tag4("n");
			dto.setHr_tag5("n");
		}else if(selectedTags.equals("TAG2")) {
			dto.setHr_tag2("y");
			dto.setHr_tag1("n");
			dto.setHr_tag3("n");
			dto.setHr_tag4("n");
			dto.setHr_tag5("n");
		}else if(selectedTags.equals("TAG3")) {
			dto.setHr_tag3("y");
			dto.setHr_tag2("n");
			dto.setHr_tag1("n");
			dto.setHr_tag4("n");
			dto.setHr_tag5("n");
		}else if(selectedTags.equals("TAG4")) {
			dto.setHr_tag4("y");
			dto.setHr_tag2("n");
			dto.setHr_tag3("n");
			dto.setHr_tag1("n");
			dto.setHr_tag5("n");
		}else if(selectedTags.equals("TAG5")) {
			dto.setHr_tag5("y");
			dto.setHr_tag2("n");
			dto.setHr_tag3("n");
			dto.setHr_tag4("n");
			dto.setHr_tag1("n");
		}
		//dto.setId((String)session.getAttribute("id"));
		
		MedicalDAO dao = new MedicalDAO();

        // 응답 데이터 작성
		/*
		 * resp.setContentType("text/html"); PrintWriter out = resp.getWriter();
		 * out.println("<html><body>"); out.println("<h2>데이터 삽입 성공</h2>");
		 * out.println("</body></html>");
		 */
        
        int result = dao.addHr(dto);
		
        if(result == 1) {
			//resp.sendRedirect("/board/medicalview.do");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print(result);
			writer.close();
			
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
    }

}
