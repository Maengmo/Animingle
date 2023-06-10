package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.WagleCommentDTO;
import com.sist.animingle.board.repository.WagleDAO;


@WebServlet("/board/waglecommentadd.do")
public class WaggleCommentAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Comment.java	
		HttpSession session = req.getSession();
		
		String content = req.getParameter("content");
		String wg_seq = req.getParameter("wg_seq");
		
		
		WagleDAO dao = new WagleDAO();
		WagleCommentDTO cdto = new WagleCommentDTO();
		
		cdto.setWgc_content(content);
		cdto.setWg_seq(Integer.parseInt(wg_seq));
		cdto.setWgc_writer((String)session.getAttribute("id"));
		cdto.setWgc_nickname((String)session.getAttribute("nickname"));
		
		int result = dao.addWagleComment(cdto);
		
		if (result == 1) {
			resp.sendRedirect("/animingle/board/wagleview.do?seq=" + wg_seq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}		
		
	}

}

