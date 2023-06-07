package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.WagleDAO;
import com.sist.animingle.board.repository.WagleDTO;


@WebServlet("/board/wagleedit.do")
public class WagleEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//WagleEdit.java
		
		String seq = req.getParameter("seq");
		
		WagleDAO dao = new WagleDAO();
		
		WagleDTO dto = dao.getWagleCont(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/wagleedit.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("wg_seq");
		String subject = req.getParameter("wg_subject");
		String content = req.getParameter("wg_content");
		String prefix = req.getParameter("wg_prefix");
		
		WagleDAO dao = new WagleDAO();
		
		WagleDTO dto = new WagleDTO();
		
		dto.setWg_seq(Integer.parseInt(seq));
		dto.setWg_subject(subject);
		dto.setWg_content(content);
		dto.setWg_prefix(prefix);
		
		int result = dao.wagleedit(dto);
		
		if (result == 1) {
			resp.sendRedirect("/animingle/board/wagleview.do?seq=" + seq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		

	}
	


}