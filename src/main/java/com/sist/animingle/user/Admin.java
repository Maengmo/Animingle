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

@WebServlet("/user/admin.do")
public class Admin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		InquiryDAO dao = new InquiryDAO();
		
		//문의 현황, 신고 현황 갯수
		int count1 = dao.getInquiryCount_1();
		int count2 = dao.getInquiryCount_2();
		
		req.setAttribute("cnt1", count1);
		req.setAttribute("cnt2", count2);
		
		//문의 답변, 신고 처리 갯수
		int count3 = dao.getAnswerCount_1();
		int count4 = dao.getAnswerCount_2();
		
		req.setAttribute("cnt3", count3);
		req.setAttribute("cnt4", count4);
		
		//문의, 신고 대시보드
		List<InquiryDTO> list1 = dao.loadDashboard1();
	    req.setAttribute("list1", list1);
	    
		List<InquiryDTO> list2 = dao.loadDashboard2();
		req.setAttribute("list2", list2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/admin.jsp");
		dispatcher.forward(req, resp);
		

	}

}
