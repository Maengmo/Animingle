package com.sist.animingle.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/logout.do")
public class Logout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Logout.java
		req.getSession().removeAttribute("id");
		req.getSession().removeAttribute("nickname");
		req.getSession().removeAttribute("isVet");
		req.getSession().removeAttribute("isPet");
		req.getSession().removeAttribute("isAdmin");
		req.getSession().removeAttribute("socialLogin");
		
		resp.sendRedirect("/animingle/index.do");
	}
}
