package com.sist.animingle.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.InAnswerDAO;
import com.sist.animingle.board.repository.InAnswerDTO;
import com.sist.animingle.board.repository.InquiryDAO;
import com.sist.animingle.board.repository.InquiryDTO;

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

}
