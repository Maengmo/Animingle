package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.WagleDAO;


@WebServlet("/board/wagledel.do")
public class WagleDel extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		WagleDAO dao = new WagleDAO();
		

		int result = 0;
		
		result = dao.delAllComment(seq);
		
		result *= dao.wagleDel(seq); 
		
		if (result >= 1) {
			resp.sendRedirect("/animingle/board/waglelist.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}	
		
	}

}
