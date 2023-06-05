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

@WebServlet("/user/checkid.do")
public class CheckId extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDAO dao = new UserDAO();
		
		String id = req.getParameter("id");  
		
		int result = dao.checkId(id);
		
		//로그인 중복 체크
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		writer.print(obj);
		writer.close();
	}
	

};