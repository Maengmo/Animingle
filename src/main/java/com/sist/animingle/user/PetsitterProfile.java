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

import com.sist.animingle.user.repository.PSApplyDTO;
import com.sist.animingle.user.repository.PetsitterDTO;
import com.sist.animingle.user.repository.UserDAO;

@WebServlet("/user/petsitterprofile.do")
public class PetsitterProfile extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PetsitterProfile.java
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String isPet = (String)session.getAttribute("isPet");
		
		if (id == null || id.equals("")) {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('회원 전용 메뉴입니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
		if (isPet == null || isPet.equals("")) {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('펫시터 회원이 아니면 접근할 수 없습니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
		UserDAO dao = new UserDAO();
		
		PetsitterDTO dto = dao.getPetsitterInfo(id);
		
		//String ps_intro = dto.getPs_intro().replace("<", "&lt;").replace(">", "&gt;");
		
		//dto.setPs_intro(ps_intro);
		
		dto.setPs_rate(dao.getPsRate(id));
		dto.setPs_matchcount(dao.getPsMatchcount(id));
		
		List<PSApplyDTO> psalist = dao.getPSAlist(id);
		
		req.setAttribute("dto", dto);
		req.setAttribute("psalist", psalist);
		
		for (PSApplyDTO psadto : psalist) {
			
			String subject = psadto.getPsr_subject();
			subject = subject.replace("<", "&lt;").replace(">", "&gt;");
			psadto.setPsr_subject(subject);
			
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/petsitterprofile.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String ps_intro = req.getParameter("ps_intro");
		
		UserDAO dao = new UserDAO();
		
		PetsitterDTO dto = new PetsitterDTO();
		
		dto.setPs_id(id);
		dto.setPs_intro(ps_intro);
		
		int result = dao.editPs_intro(dto);
		resp.setCharacterEncoding("UTF-8");
		
		if (result == 1) {
			
			resp.sendRedirect("/animingle/user/petsitterprofile.do");
			
		} else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('수정에 실패하였습니다.');history.back();</script>");
			writer.close();
			
		}
		
		
	}

}
