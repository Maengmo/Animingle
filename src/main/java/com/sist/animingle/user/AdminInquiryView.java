package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.InAnswerDAO;
import com.sist.animingle.board.repository.InAnswerDTO;
import com.sist.animingle.board.repository.InquiryDAO;
import com.sist.animingle.board.repository.InquiryDTO;

import oracle.jdbc.replay.driver.TxnReplayableSqlxml;

@WebServlet("/user/admin/inquiryview.do")
public class AdminInquiryView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		
		InquiryDAO indao = new InquiryDAO();
		InAnswerDAO andao = new InAnswerDAO();
	
		//문의글
		InquiryDTO indto = indao.inquiryView(seq);
		
		//문의글-답변
		List<InAnswerDTO> anlist = andao.inAnswerList(seq);
		
	    req.setAttribute("indto", indto);
		req.setAttribute("anlist", anlist);
	    	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/admininquiryview.jsp");
		dispatcher.forward(req, resp);

	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("in_seq");
		String content = req.getParameter("content");
		
		Calendar now = Calendar.getInstance(); //현재날짜 가져오기
		
		InAnswerDTO dto = new InAnswerDTO();
		
		dto.setA_id((String) session.getAttribute("id"));
		dto.setIn_seq(seq);
		dto.setIna_content(content);
		dto.setIna_regdate(String.format("%tF", now));
		
		InAnswerDAO dao = new InAnswerDAO();
		
		int result = dao.addAnswer(dto);
		
		InAnswerDTO newAnswer = dao.getAnswer(seq); //새로 등록한 답변 내용 불러오기
		
		//json으로 결과보내기
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		obj.put("content", newAnswer.getIna_content());
		obj.put("a_id", newAnswer.getA_id());
		obj.put("regdate", newAnswer.getIna_regdate());
		obj.put("a_nickname", newAnswer.getA_nickname());
		
		writer.print(obj);
		writer.close();
		
	
	}

}
