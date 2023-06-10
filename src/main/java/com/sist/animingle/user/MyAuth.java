package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.user.repository.UserDAO;

@WebServlet("/user/myauth.do")
public class MyAuth extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MyAuth.java
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String isPet = (String)session.getAttribute("isPet");
		String isVet = (String)session.getAttribute("isVet");
		
		if (id == null || id.equals("")) {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('회원 전용 메뉴입니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
		UserDAO dao = new UserDAO();

		String animalnum = dao.getAnimalnum(id);
		req.setAttribute("animalnum", animalnum);
		
		if (isPet != null && !isPet.equals("")) {
			String authdate = dao.getAuthdate(id); 
			req.setAttribute("authdate", authdate);
		}
		
		if (isVet != null && !isVet.equals("")) {
			String licensenum = dao.getLicensenum(id);
			req.setAttribute("licensenum", licensenum);
		}
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/myauth.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
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
		
		String regType = req.getParameter("regType");
		String regInfo = req.getParameter("regInfo");
		
		System.out.println(regType);
		System.out.println(regInfo);
		
		UserDAO dao = new UserDAO();
		
		//DB에 있는지 확인
		
		int result = 1; 
		
		//regType에 따라 테이블에 insert
		if (regType.equals("pet")) {
			result = dao.authPet(id, regInfo);
		} else if (regType.equals("petsitter")) {
			result = dao.authPetsitter(id, regInfo);
			session.setAttribute("isPet", "Y");
		} else if (regType.equals("vet")) {
			result = dao.authVet(id, regInfo);
			session.setAttribute("isVet", "Y");
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
		
	}

}
