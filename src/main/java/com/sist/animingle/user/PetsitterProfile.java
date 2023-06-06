package com.sist.animingle.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.user.repository.PSApplyDTO;
import com.sist.animingle.user.repository.PetsitterDTO;
import com.sist.animingle.user.repository.UserDAO;

@WebServlet("/user/petsitterprofile.do")
public class PetsitterProfile extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PetsitterProfile.java
		
		//HttpSession session = req.getSession();
		//String id = (String)session.getAttribute("id");
		String id = "happy012";
		
		UserDAO dao = new UserDAO();
		
		PetsitterDTO dto = dao.getPetsitterInfo(id);
		
		dto.setPs_rate(dao.getPsRate(id));
		dto.setPs_matchcount(dao.getPsMatchcount(id));
		
		List<PSApplyDTO> psalist = dao.getPSAlist(id);
		
		req.setAttribute("dto", dto);
		req.setAttribute("psalist", psalist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/petsitterprofile.jsp");
		dispatcher.forward(req, resp);

	}

}
