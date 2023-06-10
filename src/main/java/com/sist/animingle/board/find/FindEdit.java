package com.sist.animingle.board.find;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.find.repository.FindDAO;
import com.sist.animingle.board.find.repository.FindDTO;


@WebServlet("/board/findedit.do")
public class FindEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Edit.java
		//1. 데이터 가져오기(글번호)
		//2. DB 작업 > select
		//3. 결과 > JSP 호출하기
		
		String seq = req.getParameter("seq");
		
		FindDAO dao = new FindDAO();
		FindDTO dto = dao.get(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/find/findedit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String seq = req.getParameter("seq");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String prefix = req.getParameter("prefix");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
			
		content.replace("<", "&lt;");
		content.replace(">", "&gt;");
		
		FindDAO dao = new FindDAO();
		
		FindDTO dto = new FindDTO();
		dto.setSeq(seq);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPrefix(Integer.parseInt(prefix));
		dto.setLat(Double.parseDouble(lat));
		dto.setLng(Double.parseDouble(lng));
		
		int result = dao.findedit(dto);
		
		if (result == 1) {
			resp.sendRedirect("/animingle/board/findview.do?seq=" + seq + "&prefix=" + prefix);
		} else {
			PrintWriter writerAlert = resp.getWriter();
			writerAlert.print("<script>alert('failed');history.back();</script>");
			writerAlert.close();
		}
		
	}
}
