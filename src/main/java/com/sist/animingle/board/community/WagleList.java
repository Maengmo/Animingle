package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/waglelist.do")
public class WagleList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//WagleList.java
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/waglelist.jsp");
		dispatcher.forward(req, resp);
	}

}
