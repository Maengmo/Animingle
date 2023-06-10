package com.sist.animingle.board.petsitter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.PetsitterDAO;

@WebServlet("/board/petsitterdel.do")
public class PetsitterDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Object id = session.getAttribute("id");
		
		String psr_writer = req.getParameter("psr_writer");
		String psr_seq = req.getParameter("psr_seq");
		String page = req.getParameter("page");
		
		PetsitterDAO dao = new PetsitterDAO();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		
		PrintWriter writer = resp.getWriter();
		
		if (id.equals(psr_writer)) {
			
			int result = dao.petRecruitmentDel(psr_seq);
			
			if (result == 1) {
				resp.sendRedirect("/animingle/board/petsitter.do");
				
			} else {
				writer.print("<script>alert('삭제에 실패했습니다.');</script>");
				writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
				
				writer.close();
			}
			
		} else {
			writer.print("<script>alert('작성자만 게시글을 삭제할수 있습니다..');</script>");
			writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
			
			writer.close();
		}
		
	}

}
