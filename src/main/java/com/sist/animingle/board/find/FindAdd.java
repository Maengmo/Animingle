package com.sist.animingle.board.find;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.find.repository.FindDAO;
import com.sist.animingle.board.find.repository.FindDTO;

@WebServlet("/board/findadd.do")
public class FindAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/find/findadd.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		
		String writer = session.getAttribute("id").toString();
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String prefix = req.getParameter("prefix");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
			
		content.replace("<", "&lt;");
		content.replace(">", "&gt;");
		
		FindDTO dto = new FindDTO();
		dto.setWriter(writer);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPrefix(Integer.parseInt(prefix));
		dto.setLat(Double.parseDouble(lat));
		dto.setLng(Double.parseDouble(lng));
		
		
		FindDAO dao = new FindDAO();
		
		int result = dao.findadd(dto);
		
		if (result == 1) {
			resp.sendRedirect("/animingle/board/findlist.do?nowpage=&prefix=0&word=");
		} else {
			PrintWriter writerAlert = resp.getWriter();
			writerAlert.print("<script>alert('failed');history.back();</script>");
			writerAlert.close();
		}
		
				
	}
}