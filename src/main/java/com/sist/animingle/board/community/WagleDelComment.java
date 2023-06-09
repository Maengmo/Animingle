package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.WagleDAO;


@WebServlet("/board/wagledelcomment.do")
public class WagleDelComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DelComment.java
		
		String wgc_seq = req.getParameter("cseq");
		String seq = req.getParameter("seq");
		
		WagleDAO dao = new WagleDAO();
		
		int result = dao.delComment(wgc_seq);
		
		if (result == 1) {
			resp.sendRedirect("/animingle/board/wagleview.do?seq=" + seq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}	
		
	}

}




