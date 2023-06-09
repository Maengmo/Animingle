package com.sist.animingle.user;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.InquiryDAO;

@WebServlet("/user/admin.do")
public class admin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		InquiryDAO dao = new InquiryDAO();
		
		int count1 = dao.getInquiryCount_1();
		int count2 = dao.getInquiryCount_2();
		
		req.setAttribute("cnt1", count1);
		req.setAttribute("cnt2", count2);
		
		//신고완료, 문의완료
		int count3 = dao.getAnswerCount_1();
		int count4 = dao.getAnswerCount_2();
		
		req.setAttribute("cnt3", count3);
		req.setAttribute("cnt4", count4);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/admin.jsp");
		dispatcher.forward(req, resp);
		

	}

}
