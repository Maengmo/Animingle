package com.sist.animingle.board.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.VetQnADAO;
import com.sist.animingle.board.repository.VetQnAListDTO;
import com.sist.animingle.board.repository.VetQnAViewDTO;

@WebServlet("/board/vetqnalist.do")
public class VetQnAList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		VetQnADAO dao = new VetQnADAO();
		
		List<VetQnAListDTO> list = dao.list();
		
		req.setAttribute("list", list);
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/vetqnalist.jsp");
		dispatcher.forward(req, resp);

	}

}