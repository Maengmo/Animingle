package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.user.repository.MyPSRDTO;
import com.sist.animingle.user.repository.UserDAO;

@WebServlet("/user/mypetsitter.do")
public class MyPetsitter extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MyPetsitter.java
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		if (id == null || id.equals("")) {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('회원 전용 메뉴입니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
		UserDAO dao = new UserDAO();
		
		List<MyPSRDTO> psrlist = dao.getPSRlist(id);
		
		req.setAttribute("psrlist", psrlist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views//user/mypetsitter.jsp");
		dispatcher.forward(req, resp);
	}

}
