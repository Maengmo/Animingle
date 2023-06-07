package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.animingle.user.repository.UserDAO;
import com.sist.animingle.user.repository.UserDTO;

@WebServlet("/user/join.do")
public class Join extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/join.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
					req, 
					req.getRealPath("/asset/pic"), 
					1024 * 1024 * 100, 
					"UTF-8", 
					new DefaultFileRenamePolicy());
			
			System.out.println(req.getRealPath("/asset/pic"));
			
			String id = multi.getParameter("id");
			String pw = multi.getParameter("pw");
			String nickname = multi.getParameter("nickname");
			String name = multi.getParameter("name");
			String birthday = multi.getParameter("birthday");
			String tel = multi.getParameter("tel1") + "-" + multi.getParameter("tel2") + "-" + multi.getParameter("tel3");
			String email = multi.getParameter("email1") + "@" + multi.getParameter("email2");
			String address = multi.getParameter("address");
			String addressdetail = multi.getParameter("addressdetail");
			String pets = multi.getParameter("pets");
			String profile = multi.getFilesystemName("profile");
			
			System.out.println("프로필 사진 : " + profile);
			
			UserDTO dto = new UserDTO();
			dto.setUser_id(id);
			dto.setUser_pw(pw);
			dto.setUser_nickname(nickname);
			dto.setUser_name(name);
			dto.setUser_birth(birthday);
			dto.setUser_tel(tel);
			dto.setUser_email(email);
			dto.setUser_address(address);
			dto.setUser_addressdetail(addressdetail);
			dto.setUser_animal(pets);
			
			if (profile == null) {
				dto.setUser_pic("animingle.png");
			} else {
				dto.setUser_pic(profile);
			}
			
			
			UserDAO dao = new UserDAO();
					
			int result = dao.userJoin(dto);
			
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			if(result == 1) {
				
				writer.print("<script>alert('성공적으로 가입이 완료되었습니다.');location.href='/animingle/user/login.do';</script>");
				
			} else {
		
				writer.print("<script>alert('회원가입에 실패하였습니다.'); history.back();</script>");		
			}
			writer.close();	

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
