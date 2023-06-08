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
import com.sist.animingle.user.repository.PetsitterDTO;
import com.sist.animingle.user.repository.UserDAO;

@WebServlet("/user/petsitterprofilepicedit.do")
public class PetsitterProfilePicEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PetsitterProfilePicEdit.java
		//System.out.println(req.getRealPath("/asset/pic/petsitterpic"));
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
		
		MultipartRequest multi = new MultipartRequest(
				req
				,req.getRealPath("/asset/pic/petsitterpic")
				,1024 * 1024 * 100
				,"UTF-8"
				,new DefaultFileRenamePolicy()
				);
		
		String petsitterpic = multi.getFilesystemName("editpic");
		String oldpic = multi.getParameter("oldpic");
		

		
		//파일 수정 시 원래 있던 파일 삭제 
		if (petsitterpic != "") {
			File file = new File(req.getRealPath("/asset/pic/petsitterpic") + "\\" + oldpic);
			file.delete();
		}
		

		
		UserDAO dao = new UserDAO();
		PetsitterDTO dto = new PetsitterDTO();
		dto.setPs_id(id);
		dto.setPs_pic(petsitterpic);
		
		int result = dao.editPetsitterPic(dto);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		if (result == 1) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("petsitterpic", petsitterpic);
			writer.print(obj);
			writer.close();
			
		} 


	}

}
