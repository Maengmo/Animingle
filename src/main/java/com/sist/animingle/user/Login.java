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
		
		//result:일반회원과 관리자 구분해서 로그인
		UserDTO user_result = dao.login(dto);
		UserDTO admin_result = dao.login_admin(dto);
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
	
		//1. 일반회원 로그인의 경우
		if (user_result != null && admin_result ==null) {
			
			//1-1. 펫시터 체크
			int petsitter = dao.checkPetsitter(user_result.getUser_id());
			
			if (petsitter == 1) {
				req.getSession().setAttribute("isPet", "Y");
			}
			
			//1-2. 수의사 체크
			int veterinarian = dao.checkVet(user_result.getUser_id());
			
			if (veterinarian == 1) {
				req.getSession().setAttribute("isVet", "Y");
			}
			
			//3. 체크 후, 아이디, 닉네임 넣어주기
			req.getSession().setAttribute("id", user_result.getUser_id()); //인증 티켓 발급
			req.getSession().setAttribute("nickname", user_result.getUser_nickname());
			
			/*
			System.out.println("id : " + req.getSession().getAttribute("id"));
			System.out.println("nickname : " + req.getSession().getAttribute("nickname"));
			System.out.println("isPet : " + req.getSession().getAttribute("isPet"));
			System.out.println("isVet : " + req.getSession().getAttribute("isVet"));
			*/
			
			
			resp.sendRedirect("/animingle/index.do");
			
			
		} else if (user_result == null && admin_result != null) { //2. 관리자 로그인의 경우
			
			req.getSession().setAttribute("id", admin_result.getUser_id());
			req.getSession().setAttribute("nickname", admin_result.getUser_nickname());
			req.getSession().setAttribute("isAdmin", admin_result.getIsAdmin());
			
			/*
			System.out.println("id : " + req.getSession().getAttribute("id"));
			System.out.println("nickname : " + req.getSession().getAttribute("nickname"));
			System.out.println("isadmin : " + req.getSession().getAttribute("isAdmin"));
			*/
			
			resp.sendRedirect("/animingle/index.do");
			
		} else {
			//로그인 실패
			
			writer.print("<script>alert('로그인에 실패하였습니다.'); history.back();</script>");
			writer.close();
		}

	}

}
