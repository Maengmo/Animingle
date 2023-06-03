package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/communitylist.do")
public class CommunityList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//CommunityList.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/communitylist.jsp");
		dispatcher.forward(req, resp);

	}

}
