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
		
		System.out.println(seq);
		
		result = dao.findDelCPosition(seq);
		System.out.println(result);
		
		result *= dao.findDelComment(seq);
		System.out.println(result);
		
		result *= dao.findDel(seq);
		System.out.println(result);
		
		if (result >= 1) {
			resp.sendRedirect("/animingle/board/findlist.do?page=&prefix");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}

	}
}
