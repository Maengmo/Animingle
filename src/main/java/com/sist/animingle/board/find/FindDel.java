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

@WebServlet("/board/finddel.do")
public class FindDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String prefix = req.getParameter("prefix");
		
		FindDAO dao = new FindDAO();
		
		int result = 0;
				
		result = dao.findDelCPosition(seq);
		
		result *= dao.findDelComment(seq);
		
		result *= dao.findDel(seq);
		
		
		resp.sendRedirect("/animingle/board/findlist.do?page=&prefix=&word=");
		

	}
}
