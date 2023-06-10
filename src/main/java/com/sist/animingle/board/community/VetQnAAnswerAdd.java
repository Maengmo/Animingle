package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.VetQnAAnswerDTO;
import com.sist.animingle.board.repository.VetQnADAO;
import com.sist.animingle.board.repository.VetQnAViewDTO;

@WebServlet("/board/vetqnaanswer.do")
public class VetQnAAnswerAdd extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		String vq_seq = req.getParameter("vq_seq");
		String vet_seq = id;
		String vqr_content = req.getParameter("vqr_content");
		
		VetQnAAnswerDTO dto = new VetQnAAnswerDTO();
		dto.setVq_seq(vq_seq);
		dto.setVet_seq(vet_seq);
		dto.setVqr_content(vqr_content);
		
		VetQnADAO dao = new VetQnADAO();
		
		int result = dao.qnaAnswerAdd(dto);
		
		resp.sendRedirect("/animingle/board/vetqnaview.do?vq_seq=" + vq_seq);
		
	}

}
