package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/walktogetheradd.do")
public class WalkTogetherAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/walktogetheradd.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String subject = req.getParameter("subject");
		String petKind = req.getParameter("petKind");
		String walkTime = req.getParameter("walkTime");
		String text = req.getParameter("text");
		
		System.out.println(subject);
		System.out.println(petKind);
		System.out.println(walkTime);
		System.out.println(text);
		
		resp.sendRedirect("/animingle/board/walktogetherlist.do");
		
	}

}
