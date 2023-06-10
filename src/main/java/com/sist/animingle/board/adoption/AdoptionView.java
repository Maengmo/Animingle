package com.sist.animingle.board.adoption;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.adoption.repository.AdoptionDAO;
import com.sist.animingle.board.adoption.repository.AdoptionDTO;
import com.sist.animingle.board.adoption.repository.AnimalCenterDTO;

@WebServlet("/board/adoptionview.do")
public class AdoptionView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AdoptionView.java
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String num = req.getParameter("num");
			
		AdoptionDAO dao = new AdoptionDAO();
		
		AdoptionDTO dto = dao.getAnimalProfile(num);
		
		String imgurl = dao.apiImg(num);
		
		String name = dto.getName();
		
		String center = name.substring(name.indexOf("센터") - 2, name.indexOf("센터")); 
		
		AnimalCenterDTO adto = dao.getCenter(center);
		
		req.setAttribute("dto", dto);
		req.setAttribute("imgurl", imgurl);
		req.setAttribute("adto", adto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/adoption/adoptionview.jsp");
		dispatcher.forward(req, resp);

	}

}
