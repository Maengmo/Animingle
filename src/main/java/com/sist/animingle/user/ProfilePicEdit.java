package com.sist.animingle.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.animingle.user.repository.UserDAO;
import com.sist.animingle.user.repository.UserDTO;

@WebServlet("/user/profilepicedit.do")
public class ProfilePicEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ProfilePicEdit.java
		
		//System.out.println(req.getRealPath("/asset/pic/userpic"));
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
	

		MultipartRequest multi = new MultipartRequest(
				req
				,req.getRealPath("/asset/pic/userpic")
				,1024 * 1024 * 100
				,"UTF-8"
				,new DefaultFileRenamePolicy()
				);
		
		String userpic = multi.getFilesystemName("editpic");
		String oldpic = multi.getParameter("oldpic");

		
		//파일 수정 시 원래 있던 파일 삭제 
		if (userpic != "") {
			File file = new File(req.getRealPath("/asset/pic/userpic") + "\\" + oldpic);
			file.delete();
		}

		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		dto.setUser_id(id);
		dto.setUser_pic(userpic);
		
		int result = dao.editUserPic(dto);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();
		
		if (result == 1) {
			
			JSONObject obj = new JSONObject();
			obj.put("userpic", userpic);
			writer.print(obj);
			writer.close();
			
		} 
		
	}

}
