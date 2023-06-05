package com.sist.animingle.board.inquiry;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.InquiryDAO;
import com.sist.animingle.board.repository.InquiryDTO;

@WebServlet("/board/inquiry.do")
public class Inquiry extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/inquiry/inquiry.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String prefix = req.getParameter("prefix");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		InquiryDTO dto = new InquiryDTO();
		dto.setIn_prefix(prefix);
		dto.setIn_subject(title);
		dto.setIn_content(content);
		dto.setIn_writer(id);
		
		//날짜넣기
		Calendar now = Calendar.getInstance();
		dto.setIn_regdate(String.format("%tF\n", now)); 
		
		InquiryDAO dao = new InquiryDAO();
		
		int result = dao.addInquiry(dto);		

		//json으로 결과보내기
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		writer.print(obj);
		writer.close();
	
	}

}
