package com.sist.animingle.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/myquest.do")
public class MyQuest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MyQuest.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/myquest.jsp");
		dispatcher.forward(req, resp);
	}

}
