package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.user.repository.UserDAO;
import com.sist.animingle.user.repository.UserDTO;

@WebServlet("/user/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Login.java
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//LoginOk.java
		//1. 데이터 가져오기
		//2. DB 작업 > 인증
		//3. 결과 > 인증 티켓
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		UserDTO dto = new UserDTO();
		dto.setUser_id(id);
		dto.setUser_pw(pw);
		
		UserDAO dao = new UserDAO();
		
		//result: 세션에 아이디, 닉네임 넣기
		UserDTO result = dao.login(dto);

		if(result != null) {
			//로그인 성공
			req.getSession().setAttribute("id", id); //인증 티켓 발급
			req.getSession().setAttribute("nickname", result.getUser_nickname());
			
			System.out.println(req.getSession().getAttribute("id"));
			System.out.println(req.getSession().getAttribute("nickname"));
			
			resp.sendRedirect("/animingle/index.do");
		}else {
			//로그인 실패
			PrintWriter writer = resp.getWriter();
			
			writer.print("<script>alert('로그인에 실패하였습니다.'); history.back();</script>");
			writer.close();
		}
		
				
				
	}

}
