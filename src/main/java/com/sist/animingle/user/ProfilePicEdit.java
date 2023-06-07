package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//HttpSession session = req.getSession();
		//String id = (String)session.getAttribute("id");
		String id = "wain1719";
		MultipartRequest multi = new MultipartRequest(
				req
				,req.getRealPath("/asset/pic/userpic")
				,1024 * 1024 * 100
				,"UTF-8"
				,new DefaultFileRenamePolicy()
				);
		
		String userpic = multi.getFilesystemName("editpic");
		

		
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
