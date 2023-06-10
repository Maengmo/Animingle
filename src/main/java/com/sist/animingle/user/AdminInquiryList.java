package com.sist.animingle.user;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.InquiryDAO;
import com.sist.animingle.board.repository.InquiryDTO;

@WebServlet("/user/admin/inquirylist.do")
public class AdminInquiryList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//prefix 1: 문의/ prefix 2 : 신고
		String prefix = req.getParameter("prefix");
		
		InquiryDAO dao = new InquiryDAO();
		
		//문의글 불러오기
		List<InquiryDTO> list = dao.inquiryList(prefix);
	    req.setAttribute("list", list);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/admininquirylist.jsp");
		dispatcher.forward(req, resp);

	}

}
