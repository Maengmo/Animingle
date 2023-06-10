package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.user.repository.UserDAO;
import com.sist.animingle.user.repository.UserDTO;

@WebServlet("/user/profilepwedit.do")
public class ProfilePwEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ProfilePwEdit.java
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String[] user_pw = req.getParameterValues("user_pw");
		
		
		if (id == null || id.equals("")) {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('회원 전용 메뉴입니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
		if (user_pw[0].equals(user_pw[1])) {
			
			UserDAO dao = new UserDAO();
			UserDTO dto = new UserDTO();
			
			dto.setUser_id(id);
			dto.setUser_pw(user_pw[0]);
			
			int result = dao.editUserPw(dto);
			
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

}
