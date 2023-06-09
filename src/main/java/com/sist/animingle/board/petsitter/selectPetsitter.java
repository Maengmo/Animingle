package com.sist.animingle.board.petsitter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.PetsitterDAO;

@WebServlet("/board/selectpetsitter.do")
public class selectPetsitter extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String psr_seq = req.getParameter("psr_seq");
		String page = req.getParameter("page");
		String psa_seq = req.getParameter("psa_seq");
		String psr_writer = req.getParameter("psr_writer");
		
		PetsitterDAO dao = new PetsitterDAO();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		
		PrintWriter writer = resp.getWriter();
		
		if (id.equals(psr_writer)) {
			
			int rUpdate = dao.recruitmentUpdate(psr_seq);
			int aUpdate = 0;
			
			
			if (rUpdate == 1) {
				aUpdate = dao.adoptdateUpdate(psa_seq); 
				
			} else {
				writer.print("<script>alert('오류가 발생하여 작업에 실패했습니다.');</script>");
				writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
				
				writer.close();
			}
			
			if (aUpdate == 1 && rUpdate == 1) {
				writer.print("<script>alert('맡기기 완료했습니다.');</script>");
				writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
				
				writer.close();
			}
			
		} else {
			
			writer.print("<script>alert('작성자만 맡기기를 선택할수 있습니다.');</script>");
			writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
			
			writer.close();
			
		}

	}

}
