package com.sist.animingle.board.find;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.find.repository.FindCDTO;
import com.sist.animingle.board.find.repository.FindDAO;
import com.sist.animingle.board.find.repository.FindDTO;

@WebServlet("/board/findview.do")
public class FindView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		session.setAttribute("id", "pecan789");
		//session.setAttribute("id", "");
		
		String seq = req.getParameter("seq");
		String prefix = req.getParameter("prefix");
		String word = req.getParameter("word");
		String search = req.getParameter("search");
		
		
		FindDAO dao = new FindDAO();
		
		if (session.getAttribute("read") == null || session.getAttribute("read").toString().equals("n")) {
			dao.updateReadCount(seq);
			session.setAttribute("read", "y");
		
		}
		
		FindDTO dto = dao.get(seq);
		List<FindCDTO> clist = dao.getComment(seq);
		List<FindCDTO> cplist =  new ArrayList<FindCDTO>();
		
		for (FindCDTO cdto : clist) {
			
			cdto = dao.getCP(cdto);

			cplist.add(cdto);
		}
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("clist", clist);
		req.setAttribute("cplist", cplist);
		req.setAttribute("prefix", prefix);
		req.setAttribute("word", word);
		req.setAttribute("search", search);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/find/findview.jsp");
		dispatcher.forward(req, resp);

	}
	

}
