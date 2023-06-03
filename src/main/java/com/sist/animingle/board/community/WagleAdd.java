package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/wagleadd.do")
public class WagleAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//WagleAdd.java
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/wagleadd.jsp");
		dispatcher.forward(req, resp);
	}

}
