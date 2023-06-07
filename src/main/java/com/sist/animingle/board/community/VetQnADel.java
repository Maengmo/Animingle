package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.VetQnADAO;

@WebServlet("/board/vetqnadel.do")
public class VetQnADel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Object id = session.getAttribute("id");
		
		String vq_seq = req.getParameter("vq_seq");
		String user_id = req.getParameter("user_id");
		
		VetQnADAO dao = new VetQnADAO();
		
		int result = 0;
		
		if (id != null && id.equals(user_id)) {
			
		    result = dao.qnaDel(vq_seq);
		    
		    if (result == 1) {
		        resp.sendRedirect("/animingle/board/vetqnalist.do");
		        
		    } else {
		        PrintWriter writer = resp.getWriter();
		        writer.println("<script>alert('삭제 실패');</script>");
		        resp.sendRedirect("/animingle/board/vetqnaview.do?vq_seq=" + vq_seq);
		        writer.close();
		    }
		    
		} else {
		    resp.sendRedirect("/animingle/index.do");
		}

	}

}
