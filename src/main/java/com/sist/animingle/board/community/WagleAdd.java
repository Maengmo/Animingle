package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.WagleDAO;
import com.sist.animingle.board.repository.WagleDTO;

@WebServlet("/board/wagleadd.do")
public class WagleAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/wagleadd.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = (String) session.getAttribute("id");
		String waglesub = req.getParameter("waglesub");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		WagleDTO dto = new WagleDTO();
		
		dto.setWg_writer(id);
		dto.setWg_prefix(waglesub);
		dto.setWg_subject(title);
		dto.setWg_content(content);
		
		WagleDAO dao = new WagleDAO();
		
		int result = dao.wagleAdd(dto);
		
		resp.sendRedirect("/animingle/board/waglelist.do?page=1");
		
	}

}
