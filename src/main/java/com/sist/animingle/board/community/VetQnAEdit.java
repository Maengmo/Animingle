package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.VetQnADAO;
import com.sist.animingle.board.repository.VetQnAViewDTO;

@WebServlet("/board/vetqnaedit.do")
public class VetQnAEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String vq_seq = req.getParameter("vq_seq");
		String vq_subject = req.getParameter("vq_subject");
		String vq_content = req.getParameter("vq_content");
		String vq_prefix = req.getParameter("vq_prefix");
		
		req.setAttribute("vq_seq", vq_seq);
		req.setAttribute("vq_subject", vq_subject);
		req.setAttribute("vq_content", vq_content);
		req.setAttribute("vq_prefix", vq_prefix);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/vetqnaedit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String vq_seq = req.getParameter("vq_seq");
		String vq_subject = req.getParameter("title");
		String vq_content = req.getParameter("content");
		String vq_prefix = req.getParameter("tag");
		
		System.out.println(vq_seq);
		System.out.println(vq_subject);
		System.out.println(vq_content);
		System.out.println(vq_prefix);
		
		//말머리 숫자로 변환 (강아지:1, 고양이:2, 기타:3)
		if (vq_prefix.equals("강아지")) {
			vq_prefix = "1";
		} else if (vq_prefix.equals("고양이")) {
			vq_prefix = "2";
		}  else if (vq_prefix.equals("기타")) {
			vq_prefix = "3";
		}
		
		VetQnAViewDTO dto = new VetQnAViewDTO();
		dto.setVq_seq(vq_seq);
		dto.setVq_subject(vq_subject);
		dto.setVq_content(vq_content);
		dto.setVq_prefix(vq_prefix);
		
		System.out.println(dto.getVq_seq());
		System.out.println(dto.getVq_subject());
		System.out.println(dto.getVq_content());
		System.out.println(dto.getVq_prefix());
		
		VetQnADAO dao = new VetQnADAO();
		
		int result = dao.vetQnAEdit(dto);
		
		if (result == 1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		resp.sendRedirect("/animingle/board/vetqnaview.do?vq_seq=" + vq_seq);
		
	}

}
