package com.sist.animingle.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/mypetsitter.do")
public class MyPetsitter extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MyPetsitter.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views//user/mypetsitter.jsp");
		dispatcher.forward(req, resp);
	}

}
