package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.repository.WalkTogetherDAO;

@WebServlet("/board/walktogetherfin.do")
public class WalkTogetherFin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//complete
		
		String wt_seq = req.getParameter("seq");
		
		WalkTogetherDAO dao = new WalkTogetherDAO();
		
		dao.updateState(wt_seq);

		resp.sendRedirect("/animingle/board/walktogetherlist.do");

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// delete
		super.doPost(req, resp);
	}

}
