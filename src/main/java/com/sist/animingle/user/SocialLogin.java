package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.sist.animingle.user.repository.UserDAO;
import com.sist.animingle.user.repository.UserDTO;

@WebServlet("/user/sociallogin.do")
public class SocialLogin extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String nickname = req.getParameter("nickname");
		String profile_image = req.getParameter("profile_image");
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setUser_id(id);
		dto.setUser_email(email);
		dto.setUser_nickname(nickname);
		dto.setUser_pic(profile_image);
		
		//카카오로 로그인한 유저가 유저 테이블에 존재하는지?
		int result = dao.kakaoUserCheck(dto);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		JSONObject obj = new JSONObject();
		
		//1. 유저가 있다! => 로그인
		if (result == 1) {
			
			UserDTO result3 = dao.kakaoUserLogin(dto);
			
			//로그인 성공시
			if (result3 != null) {
				req.getSession().setAttribute("id", result3.getUser_id()); //인증 티켓 발급
				req.getSession().setAttribute("nickname", result3.getUser_nickname());
				req.getSession().setAttribute("socialLogin", "kakao");
				req.getSession().setAttribute("isVet", null);
				req.getSession().setAttribute("isPet", null);
				req.getSession().setAttribute("isAdmin", null);
				
				obj.put("result", "success");
				writer.print(obj);
				writer.close();
				
			} else {
				obj.put("result", "failed");
				writer.print(obj);
				writer.close();
			}
			
		} else if (result == 0) { //2. 유저가 없다! => user 테이블에 정보 넣고 로그인
			
			int result1 = dao.kakaoUserJoin(dto); //user 테이블에 정보 넣기
			
			//System.out.println("정보넣기의 결과 : " + result1);
			
			if (result1 == 1) {
				//정보넣기 성공시
				UserDTO result2 = dao.kakaoUserLogin(dto); //user 로그인
				
				//System.out.println("user 로그인의 결과 : " + result2);

				
				if (result2 != null) {
					//로그인 성공시
					req.getSession().setAttribute("id", result2.getUser_id()); //인증 티켓 발급
					req.getSession().setAttribute("nickname", result2.getUser_nickname());
					req.getSession().setAttribute("socialLogin", "kakao");
					req.getSession().setAttribute("isVet", null);
					req.getSession().setAttribute("isPet", null);
					req.getSession().setAttribute("isAdmin", null);
					
					obj.put("result", "success");
					writer.print(obj);
					writer.close();
				}
				else {
					obj.put("result", "failed");
					writer.print(obj);
					writer.close();
				}
			} else {
				obj.put("result", "failed");
				writer.print(obj);
				writer.close();
			}
			
		} else {
			obj.put("result", "failed");
			writer.print(obj);
			writer.close();
		}
		
		
	}

}


