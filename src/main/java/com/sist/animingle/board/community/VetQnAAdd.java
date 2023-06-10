package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.VetQnAAddDTO;
import com.sist.animingle.board.repository.VetQnADAO;

@WebServlet("/board/vetqnaadd.do")	
public class VetQnAAdd extends HttpServlet {	

	@Override	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/vetqnaadd.jsp");	
		dispatcher.forward(req, resp);	

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		req.setCharacterEncoding("UTF-8");
		
		String vq_writer = id;
		String vq_subject = req.getParameter("title");
		String vq_prefix = req.getParameter("tag");
		String vq_content = req.getParameter("content");
		
		VetQnAAddDTO dto = new VetQnAAddDTO();
		
		//말머리 숫자로 변환 (강아지:1, 고양이:2, 기타:3)
		if (vq_prefix.equals("강아지")) {
			vq_prefix = "1";
		} else if (vq_prefix.equals("고양이")) {
			vq_prefix = "2";
		}  else if (vq_prefix.equals("기타")) {
			vq_prefix = "3";
		}
		
		dto.setVq_writer(vq_writer);
		dto.setVq_subject(vq_subject);
		dto.setVq_prefix(vq_prefix);
		dto.setVq_content(vq_content);
		
		VetQnADAO dao = new VetQnADAO();
		int result = dao.qnaAdd(dto);
		
		resp.sendRedirect("/animingle/board/vetqnalist.do");
		
	}

}	

