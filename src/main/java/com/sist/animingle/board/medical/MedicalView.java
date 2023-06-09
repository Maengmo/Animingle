package com.sist.animingle.board.medical;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.MedicalDAO;
import com.sist.animingle.board.repository.PReviewDTO;
import com.test.my.DBUtil;

@WebServlet("/board/medicalview.do")
public class MedicalView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//medical.java
		
		if (MedicalDAO.mapconn == null) {
			
			MedicalDAO.mapconn = DBUtil.open("3.38.234.229", "admin", "java1234");
	
		}
		
		//System.out.println(h_seq);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/medical/medicalview.jsp");
		dispatcher.forward(req, resp);
	
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
		
        // 폼 데이터에서 가져온 값
        String selectedTags = req.getParameter("selectedTags");
        String reviewText = req.getParameter("reviewText");
        String fileName = req.getParameter("fileName");
        String rating = req.getParameter("rating");
        String pseq = req.getParameter("seq");
        
        System.out.println(selectedTags);
        System.out.println(pseq);

        // 여기서 데이터베이스에 데이터를 삽입하는 로직을 구현하면 됩니다.
        PReviewDTO dto = new PReviewDTO();
		dto.setPr_content(reviewText);
		dto.setPr_receipt(fileName);
		dto.setPr_rate(rating);
		dto.setP_seq(pseq);
		if(selectedTags.equals("TAG1")) {
			dto.setPr_tag1("y");
			dto.setPr_tag2("n");
			dto.setPr_tag3("n");
			dto.setPr_tag4("n");
			dto.setPr_tag5("n");
		}else if(selectedTags.equals("TAG2")) {
			dto.setPr_tag2("y");
			dto.setPr_tag1("n");
			dto.setPr_tag3("n");
			dto.setPr_tag4("n");
			dto.setPr_tag5("n");
		}else if(selectedTags.equals("TAG3")) {
			dto.setPr_tag3("y");
			dto.setPr_tag2("n");
			dto.setPr_tag1("n");
			dto.setPr_tag4("n");
			dto.setPr_tag5("n");
		}else if(selectedTags.equals("TAG4")) {
			dto.setPr_tag4("y");
			dto.setPr_tag2("n");
			dto.setPr_tag3("n");
			dto.setPr_tag1("n");
			dto.setPr_tag5("n");
		}else if(selectedTags.equals("TAG5")) {
			dto.setPr_tag5("y");
			dto.setPr_tag2("n");
			dto.setPr_tag3("n");
			dto.setPr_tag4("n");
			dto.setPr_tag1("n");
		}
		//dto.setId((String)session.getAttribute("id"));
		
		MedicalDAO dao = new MedicalDAO();

        // 응답 데이터 작성
		/*
		 * resp.setContentType("text/html"); PrintWriter out = resp.getWriter();
		 * out.println("<html><body>"); out.println("<h2>데이터 삽입 성공</h2>");
		 * out.println("</body></html>");
		 */
        
        int result = dao.addPr(dto);
		
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
