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
import com.sist.animingle.user.repository.PetsitterDTO;
import com.sist.animingle.user.repository.UserDAO;

@WebServlet("/user/petsitterprofilepicedit.do")
public class PetsitterProfilePicEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PetsitterProfilePicEdit.java
		//System.out.println(req.getRealPath("/asset/pic/petsitterpic"));
		//HttpSession session = req.getSession();
		//String id = (String)session.getAttribute("id");
		String id = "happy012";
		MultipartRequest multi = new MultipartRequest(
				req
				,req.getRealPath("/asset/pic/petsitterpic")
				,1024 * 1024 * 100
				,"UTF-8"
				,new DefaultFileRenamePolicy()
				);
		
		String petsitterpic = multi.getFilesystemName("editpic");
		

		
		UserDAO dao = new UserDAO();
		PetsitterDTO dto = new PetsitterDTO();
		dto.setPs_id(id);
		dto.setPs_pic(petsitterpic);
		
		int result = dao.editPetsitterPic(dto);
		
		PrintWriter writer = resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		if (result == 1) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("petsitterpic", petsitterpic);
			writer.print(obj);
			writer.close();
			
		} 


	}

}
