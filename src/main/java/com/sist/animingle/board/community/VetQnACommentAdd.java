package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.VetQnACommentDTO;
import com.sist.animingle.board.repository.VetQnADAO;
import com.sist.animingle.board.repository.VetQnAViewDTO;

@WebServlet("/board/vetqnacomment.do")
public class VetQnACommentAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		String vqr_seq = req.getParameter("vqr_seq");
		String vqrc_writer = req.getParameter("vqrc_writer");
		String vqrc_content = req.getParameter("vqrc_content");
		
		System.out.println(vqr_seq);
		System.out.println(vqrc_writer);
		System.out.println(vqrc_content);
		
		VetQnACommentDTO dto = new VetQnACommentDTO();
		dto.setVqr_seq(vqr_seq);
		dto.setVqrc_writer(vqrc_writer);
		dto.setVqrc_content(vqrc_content);
		
		VetQnADAO dao = new VetQnADAO();
		int result = dao.qnaCommentAdd(dto);
		
		//ajax로 전송할 값
		VetQnAViewDTO commentDTO = dao.getComment(vqr_seq);
		
		PrintWriter writer = resp.getWriter();
		
		JSONObject obj = new JSONObject();
		
		obj.put("user_pic", commentDTO.getUser_pic());
		obj.put("vqr_seq", commentDTO.getVqr_seq());
		obj.put("vqrc_writer", commentDTO.getVqrc_writer());
		obj.put("vqrc_regdate", commentDTO.getVqrc_regdate() + "");
		obj.put("vqrc_content", commentDTO.getVqrc_content());
		obj.put("comment_cnt", commentDTO.getComment_cnt());
		
		writer.print(obj);
		writer.close();
		
	}

}
