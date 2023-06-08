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
import com.sist.animingle.user.repository.UserDTO;

@WebServlet("/user/profile.do")
public class Profile extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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

		//소셜로그인 회원이면 비밀번호 수정 못하게 해야함
		
		UserDAO dao = new UserDAO();
		
		UserDTO dto = dao.getUserInfo(id);
		int boardcnt = dao.getBoardcnt(id);
		int commentcnt = dao.getCommentcnt(id);
		
		req.setAttribute("dto", dto);
		req.setAttribute("boardcnt", boardcnt);
		req.setAttribute("commentcnt", commentcnt);
		//req.setAttribute("socailLogin", "y");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/profile.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//HttpSession session = req.getSession();
		//String id = (String)session.getAttribute("id");
		String id = "wain1719";
		
		String user_nickname = req.getParameter("user_nickname");
		String user_address = req.getParameter("user_address");
		String user_addressdetail = req.getParameter("user_addressdetail");
		String user_tel = req.getParameter("tel1") +"-"+ req.getParameter("tel2") +"-"+ req.getParameter("tel3");
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setUser_id(id);
		dto.setUser_nickname(user_nickname);
		dto.setUser_address(user_address);
		dto.setUser_addressdetail(user_addressdetail);
		dto.setUser_tel(user_tel);
		
		int result = dao.editUserInfo(dto);
		
		resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        
        PrintWriter writer = resp.getWriter();
		
		if (result == 1) {
			writer.print("<script>location.href='/animingle/user/profile.do';</script>");
		} else {
			
			writer.print("<script>alert('수정에 실패하였습니다.'); history.back();</script>");
			writer.close();
		}
		
		
	}
}
