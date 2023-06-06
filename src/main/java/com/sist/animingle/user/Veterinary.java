package com.sist.animingle.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.user.repository.UserDAO;
import com.sist.animingle.user.repository.VeterinarianDTO;

@WebServlet("/user/veterinary.do")
public class Veterinary extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//
		//HttpSession session = req.getSession();
		//String id = (String)session.getAttribute("id");
		String id = "ebony012";
		
		UserDAO dao = new UserDAO();
		
		VeterinarianDTO dto = dao.getVetInfo(id);
		
		List<String> vclist = dao.getVClist(id);
		//List<VetQnADTO> vqlist = dao.getVQlist(id);
		
		req.setAttribute("dto", dto);
		req.setAttribute("vclist", vclist);
		//req.setAttribute("vqlist", vqlist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/veterinary.jsp");
		dispatcher.forward(req, resp);

	}
}
